# -*- coding: utf-8 -*-
import asyncio
import os
import inspect          # 新增，用于判断是否 awaitable
from typing import Optional, Callable
from openai import AsyncOpenAI
from tenacity import retry, stop_after_attempt, wait_exponential
from pathlib import Path

class QwenModelConfig:
    """
    封装 Qwen（阿里云 DashScope OpenAI 兼容接口）文本模型。
    """

    def __init__(
        self,
        api_key: Optional[str] = None,
        model_name: str = "qwen3-235b-a22b",
        base_url: str = "https://dashscope.aliyuncs.com/compatible-mode/v1",
        system_prompt: str = "You are a helpful assistant."
    ):
        api_key = (
            api_key
            or os.getenv("QWEN_API_KEY")
            or os.getenv("DASHSCOPE_API_KEY")
        )
        if not api_key:
            raise ValueError(
                "未找到 DashScope API‑KEY！请在实例化时传入 api_key "
                "或设置环境变量 QWEN_API_KEY / DASHSCOPE_API_KEY"
            )

        self.async_client = AsyncOpenAI(
            api_key=api_key,
            base_url=base_url,
        )
        self.model_name = model_name
        # self.system_prompt = system_prompt


        current_directory = os.getcwd()
        # prompt
        p_path = Path(current_directory) /"prompts/danone_post.tpl"  
        prompt = p_path.read_text()
        print(prompt)
        self.system_prompt = prompt

    @retry(stop=stop_after_attempt(3),
           wait=wait_exponential(multiplier=1, min=2, max=10))
    async def process_input(
        self,
        prompt: str,
        model_name: Optional[str] = None,
        temperature: float = 0.7,
        max_tokens: int = 1024,
        # stream: bool = True,
        stream: bool = False,
        on_stream: Optional[Callable[[str], None]] = None
    ) -> str:

        model = model_name or self.model_name
        messages = [
            {"role": "system", "content": self.system_prompt},
            {"role": "user", "content": prompt}
        ]

        if not stream:
            resp = await self.async_client.chat.completions.create(
                model=model,
                messages=messages,
                temperature=temperature,
                max_tokens=max_tokens,
                stream=False
            )
            return resp.choices[0].message.content

        collected_text = ""
        try:
            stream_resp = await self.async_client.chat.completions.create(
                model=model,
                messages=messages,
                temperature=temperature,
                max_tokens=max_tokens,
                stream=True
            )
        except Exception as e:
            print("对话创建错误："+str(e))
            return QwenResponse("对话创建错误")
        try:
            async for chunk in stream_resp:
                if chunk.choices and chunk.choices[0].delta.content:
                    delta = chunk.choices[0].delta.content
                    collected_text += delta
                    if on_stream:
                        # ------------------------ 修改开始 ------------------------
                        # 同时兼容同步函数与 async 协程函数
                        result = on_stream(delta)
                        if inspect.isawaitable(result):   # 若返回的是可等待对象
                            await result                   # 则等待它执行完毕
                        # ------------------------ 修改结束 ------------------------
        except Exception as e:
            # 大概率是数据被绿网过滤了。
            print("数据请求错误", e)
            return QwenResponse("数据请求错误："+str(e))
        return QwenResponse(collected_text)
    
    
class QwenResponse:
    """模拟OpenAI响应格式的千问响应类"""

    def __init__(self, response_data):
        """
        增加text的属性

        参数:
            response_data: API返回的原始响应数据
        """
        self.text = response_data



# ======================= 自测入口 =======================
# def main():
    # from configs.config import qwen_api_key as api_key
    # if not api_key:
    #     raise RuntimeError(
    #         "请先设置环境变量 QWEN_API_KEY（或 DASHSCOPE_API_KEY），"
    #         "或在代码中直接传递 api_key。"
    #     )



async def createTag(user_prompt) -> str:

        prompt = user_prompt

        api_key = ""
        qwen = QwenModelConfig(api_key=api_key)

        print("\n>>> 流式模式（同步回调）")
        def printer(delta):
            print(delta, end="", flush=True)

        txt_stream = await qwen.process_input(
            prompt, # "如何穿越成崇祯?"
            stream=True,
            on_stream=printer
        )
        # txt_stream = qwen.process_input(
        #     prompt, # "如何穿越成崇祯?"
        #     stream=True,
        #     on_stream=printer
        # )
        
        print("\n\n[模型输出] \n", txt_stream.text)
        return txt_stream.text

if __name__ == "__main__":
    # main()
    user_prompt = '[{"text": "刺猬阿甘花椒锅巴，辣中带香的绝妙滋味！ 没想到刺猬阿甘的花椒锅巴居然这么好吃！浓浓的花椒香融入米香，一口下去椒香酥脆，麻麻辣辣，真的是越嚼越香！一包接一包追剧真的太过瘾啦！#锅巴零食推荐 #花椒锅巴 #锅巴 #脆锅巴 #超便宜超划算", "post_id": "7390374207273667892"}]'
    asyncio.run(createTag(user_prompt))

