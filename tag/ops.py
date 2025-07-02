from db_init import create_db_engine, init_db, create_input_tables, create_validate_tables
import sqlalchemy
# from tagging import content_tagging 
import time

import queue
import threading
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

def input_select(engine, metadata, content_tagging_creation_partial, run_id):
    dwd_filtered_input = create_input_tables(metadata)
    
    # print("Tables created:", dwd_filtered_input.name)

    with engine.connect() as connection:
        # metadata.create_all(connection)
        
        # insert_query = dwd_filtered_input.insert().values(ids="1", content='{"a":"aValue"}')
        # connection.execute(insert_query)
        # connection.commit() 

        query = dwd_filtered_input.select()
        result = connection.execute(query)

        # obj_list = []
        for row in result:
            # print(row)
            # print([row.ids, row.content])
            print(row.ids)

            validate_success_data = content_tagging_creation_partial(row.ids, row.content)

            input_insert(engine, metadata, validate_success_data, run_id)
            # obj = pool.submit(validate_success_data, content_tagging_creation_partial, row.ids, row.content)
            # obj_list.append(obj)


        # for future in as_completed(obj_list):
        #     data = future.result()
        #     print(data)
        #     print('*' * 50)        

        
def input_insert(engine, metadata, validated_success_data, run_id):
    validate = create_validate_tables(metadata)    

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

# if __name__ == "__main__":
#     input_select()


