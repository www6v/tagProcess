import requests
import time
# from testing.qwen_test import createTag
# import os
import json
import asyncio


def send_post_request(url: str, json_body: dict, headers: dict = None, params: dict = None)  -> requests.Response:
    """
    Send an HTTP POST request with a JSON body, custom headers, and query parameters.

    Args:
        url (str): The URL to send the request to.
        json_body (dict): The JSON body of the request.
        headers (dict, optional): Custom HTTP headers. Defaults to None.
        params (dict, optional): Query parameters. Defaults to None.

    Returns:
        requests.Response: The response from the server.
    """
    try:
        response = requests.post(
            url,
            json=json_body,  # Automatically sets Content-Type to application/json
            headers=headers,
            params=params,
        )
        response.raise_for_status()  # Raise an exception for HTTP errors
        return response
    except requests.exceptions.RequestException as e:
        print(f"Request failed: {e}")
        raise



def prepare(userPrompt, systemPrompt, qwenToken, modelName):
    data = userPrompt

    url = "https://dashscope.aliyuncs.com/api/v1/services/aigc/text-generation/generation"   

    model = modelName

    json_body = {
        "model": model,
        "input": {
            "messages": [{
                    "role": "system",
                    "content":  systemPrompt
                },
                {
                    "role": "user",
                    "content": data
                }
            ]
        },
        "parameters": {
            "result_format": "message",
            "top_p": 0.8,
            "temperature": 0.7
        }
    }

    # Example headers
    headers = {
        "Authorization": "Bearer " + qwenToken,
        "Content-Type": "application/json",
        "Custom-Header": "CustomValue",
    }

    params = {
        "run_id": "1",
        "url": url,
        "model": model,
        "data_id": "1",
        "prompt": "",
        "data": "",
        "start_request_time": "",
    }
    
    return url,json_body,headers,params


def content_tagging(strDict: str, prompt:str, qwenToken:str,modelName:str) -> dict:
    url, json_body, headers, params = prepare(strDict, prompt, qwenToken, modelName)

    response = send_post_request(url, json_body, headers, params)

    # json_str = str(response.json())
    # data = json.loads(json_str)

    data = response.json()
    # Extract the required fields
    validated_success_data = {
        "input_tokens": data["usage"]["input_tokens"],
        "output_tokens": data["usage"]["output_tokens"],
        "total_tokens": data["usage"]["total_tokens"],
        "request_id": data["request_id"],
        "finish_reason": data["output"]["choices"][0]["finish_reason"],
        "content": data["output"]["choices"][0]["message"]["content"]
    }

    return {
        "result": validated_success_data,
    }

### add
def content_tagging_creation(systemPrompt:str, qwenToken:str,modelName:str, ids:str, userSystem: str) -> dict:
    url, json_body, headers, params = prepare(userSystem, systemPrompt, qwenToken, modelName)
    print(f"tagging with llm.  --> ids: {ids}")

    response = send_post_request(url, json_body, headers, params)

    # json_str = str(response.json())
    # data = json.loads(json_str)

    data = response.json()

    print(f"tagging with llm.  --> complete: {ids}")

    start_request_time = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())
    validated_success_data = {
        "input_tokens": data["usage"]["input_tokens"],
        "output_tokens": data["usage"]["output_tokens"],
        "total_tokens": data["usage"]["total_tokens"],
        "request_id": data["request_id"],
        "finish_reason": data["output"]["choices"][0]["finish_reason"],
        "content": data["output"]["choices"][0]["message"]["content"],
        "data_id": ids,

        "prompt": systemPrompt,
        "modelName": modelName,
        "source_response": data["output"]["choices"][0]["message"]["content"],
        "start_request_time": start_request_time
    }

    print(f"tagging with llm.  --> complete: {validated_success_data}")

    return validated_success_data



# ### add
# def content_tagging_creation(systemPrompt:str, qwenToken:str,modelName:str, ids:str, userSystem: str) -> dict:
#     url, json_body, headers, params = prepare(userSystem, systemPrompt, qwenToken, modelName)
#     print(f"tagging with llm.  --> ids: {ids}")

#     print("strDict: " + userSystem)

#     content = asyncio.run(createTag(userSystem))
#     # data = json.loads(text)

#     # response = send_post_request(url, json_body, headers, params)


#     # json_str = str(response.json())
#     # data = json.loads(json_str)

#     # data = response.json()

#     print(f"tagging with llm.  --> complete: {ids}")

#     start_request_time = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())
#     validated_success_data = {
#         "input_tokens": data["usage"]["input_tokens"],
#         "output_tokens": data["usage"]["output_tokens"],
#         "total_tokens": data["usage"]["total_tokens"],
#         "request_id": data["request_id"],
#         "finish_reason": data["output"]["choices"][0]["finish_reason"],
#         "content": data["output"]["choices"][0]["message"]["content"],
#         "data_id": ids,

#         "prompt": systemPrompt,
#         "modelName": modelName,
#         "source_response": data["output"]["choices"][0]["message"]["content"],
#         "start_request_time": start_request_time
#     }

#     print(f"tagging with llm.  --> complete: {validated_success_data}")

#     return validated_success_data    