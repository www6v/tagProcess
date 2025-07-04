
from db.db_init import (create_db_engine, 
                        init_db, 
                        input_tables, 
                        validate_tables, 
                        dwd_issue_tables, 
                        dwd_refined_tag_tables,
                        tag_creation_template,
                        tag_mapping_template)
import sqlalchemy
from sqlalchemy import text
# from tagging import content_tagging 
import time

# import queue
# import threading
from concurrent.futures import ThreadPoolExecutor, as_completed



# from gevent import monkey; monkey.patch_all()
# import gevent
# from gevent.queue import Queue  # 队列 gevent中的队列
# import random


pool = ThreadPoolExecutor(max_workers=1000)  # 创建线程池，最大线程数为10


def validate_success_data(content_tagging_creation_partial, ids, content):
    """
    Validate the success data by calling the content tagging creation function.
    """
    validated_success_data = content_tagging_creation_partial(ids, content)
    return validated_success_data


def create_metadata(db_url: str):
    # db_url = "sqlite:///example.db"  # Replace with your actual database URL# Example MySQL URL
    engine = create_db_engine(db_url)
    
    init_db(engine)
    
    metadata = sqlalchemy.MetaData()

    return engine, metadata    

def select_dwd_filtered_input(engine, metadata, content_tagging_creation_partial, run_id)-> list:
    dwd_filtered_input = input_tables(metadata)
    
    # print("Tables created:", dwd_filtered_input.name)

    with engine.connect() as connection:
        # metadata.create_all(connection)
        
        # insert_query = dwd_filtered_input.insert().values(ids="1", content='{"a":"aValue"}')
        # connection.execute(insert_query)
        # connection.commit() 

        query = dwd_filtered_input.select()
        result = connection.execute(query)

        validate_success_data_list = []
        # obj_list = []
        for row in result:
            # print(row)
            # print([row.ids, row.content])
            print(row.ids)

            validate_success_data = content_tagging_creation_partial(row.ids, row.content)

            validate_success_data_list.append(validate_success_data)
            # obj = pool.submit(validate_success_data, content_tagging_creation_partial, row.ids, row.content)
            # obj_list.append(obj)

        return validate_success_data_list
        # for future in as_completed(obj_list):
        #     data = future.result()
        #     print(data)
        #     print('*' * 50)        

        
def insert_validated_success_data(engine, metadata, validated_success_data, run_id):
    validate = validate_tables(metadata)    

    with engine.connect() as connection:
        # contentStr = validated_success_data['content']
        input_tokens = validated_success_data["input_tokens"]
        output_tokens = validated_success_data["output_tokens"]
        total_tokens = validated_success_data["total_tokens"]
        request_id = validated_success_data["request_id"]
        finish_reason = validated_success_data["finish_reason"]
        content = validated_success_data["content"]
        prompt = validated_success_data["prompt"]
        modelName = validated_success_data["modelName"]
        source_response = validated_success_data["source_response"]
        start_request_time = validated_success_data["start_request_time"]
        data_id = validated_success_data["data_id"]
        end_request_time = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())

        insert_query = validate.insert().values(
            # id="1",
            run_id=run_id,
            openai_id=request_id,
            prompt_tokens=input_tokens,
            completion_tokens=output_tokens,
            total_tokens=total_tokens,
            model=modelName,
            created=start_request_time,
            content=content,
            finish_reason=finish_reason,
            data_id=data_id,
            prompt=prompt, 
            source_response = source_response,
            start_request_time= start_request_time,
            end_request_time= end_request_time            
        )
        connection.execute(insert_query)
        connection.commit() 


def select_dwd_issue(metadata, engine, systemPrompt, api_token, modelName) -> list:
    dwd_issue = dwd_issue_tables(metadata)    

    systemPromptP = systemPrompt
    with engine.connect() as connection:        
        query = dwd_issue.select()
        result = connection.execute(query)


        userPrompt_list = []
        # obj_list = []
        for row in result:
            print(row.content)

            userPrompt = row.content

            userPrompt_list.append(userPrompt)


        return  userPrompt_list  


def select_dwd_refined_tag(metadata,engine) -> str:
    dwd_refined_tag = dwd_refined_tag_tables(metadata)
    
    list_result = []
    with engine.connect() as connection:  
        # query = dwd_refined_tag.select()
        # result = connection.execute(query)

        # for row in result:
        #     list_result.append({"id": row.id, "biz_type": row.biz_type, "biz_type_index": row.biz_type_index, "refined_tag": row.refined_tag})

        result = connection.execute( text("SELECT * FROM dwd_refined_tag WHERE create_time=(SELECT MAX(create_time) FROM dwd_refined_tag where biz_type ='market')") )
        row = result.fetchone()
        refined_tag = row.refined_tag

        return refined_tag
    
    # return list_result


def insert_dwd_refined_tag(metadata,engine, content):

    index = 0            
    with engine.connect() as connection:  
            dwd_refined_tag = dwd_refined_tag_tables(metadata)
            insert_query = dwd_refined_tag.insert().values(
                biz_type="market",
                biz_type_index="market",
                refined_tag=content
            )
            index = index + 1
            connection.execute(insert_query)
            connection.commit()     


##########   template 

def select_tag_creation_template(metadata, engine) -> list:
    tag_creation_template_table = tag_creation_template(metadata)
    
    list_result = []
    with engine.connect() as connection:  
        query = tag_creation_template_table.select().where(tag_creation_template_table.c.id == 1)
        result = connection.execute(query)

        for row in result:
            list_result.append({"id": row.id, "role": row.role, "target":row.target, "tag_list": row.tag_list})

    return list_result


def select_tag_mapping_template(metadata, engine) -> list:
    tag_tag_mapping_template = tag_mapping_template(metadata)
    
    list_result = []
    with engine.connect() as connection:  
        query = tag_tag_mapping_template.select().where(tag_tag_mapping_template.c.id == 1)
        result = connection.execute(query)

        for row in result:
            list_result.append({"id": row.id, "role":row.role, "target":row.target, "category": row.category})

    return list_result



# if __name__ == "__main__":
#     input_select()


