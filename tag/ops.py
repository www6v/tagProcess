from db_init import create_db_engine, init_db, create_input_tables, create_validate_tables
import sqlalchemy
# from tagging import content_tagging 
import time

import queue
import threading

from gevent import monkey; monkey.patch_all()
import gevent
from gevent.queue import Queue  # 队列 gevent中的队列
# import random

task_queue = Queue(1000)

# task_queue = queue.Queue()


# def process_task(task_queue, content_tagging_creation_partial=None, engine=None, metadata=None, run_id=None):
#     while True:
#         # task = task_queue.get()
#         # print(f"Processing task: {task}")

#         item = task_queue.get()
#         ids = item["ids"]
#         content = item["content"]

#         print(f"Processing task: {item}")  

#         validated_success_data = content_tagging_creation_partial(ids, content)  
#         # validated_success_data = content_tagging_creation_partial(row.ids, row.content)       
#         input_insert(engine, metadata, validated_success_data, run_id)

#         # time.sleep(1)
#         # task_queue.task_done()

def producer(index:int, all:dict):
    while True:
        print(f'生产者 [{index}]')
        # item = random.randint(0, 99)

        task_queue.put(all)

        # print(f"生产 ---> {all}")
        print(f"生产 ---> all")
 
 
def consumer(index=1, content_tagging_creation_partial=None, engine=None, metadata=None, run_id=None):
    while True:
        print(f'消费者 [{index}]')
        item = task_queue.get()
        ids = item["ids"]
        content = item["content"]

        validated_success_data = content_tagging_creation_partial(ids, content)  
        # validated_success_data = content_tagging_creation_partial(row.ids, row.content)       
        input_insert(engine, metadata, validated_success_data, run_id)

        print(f"消费 ---> {ids}")

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

        job_list=[]
        for row in result:
            # print(row)
            # print([row.ids, row.content])

            # task_queue.put({"ids":row.ids, "content":row.content})

            job_1 = gevent.spawn(producer, index=1, all={"ids":row.ids, "content":row.content})
            job_list.append(job_1)


        job_2 = gevent.spawn(consumer, index=1, content_tagging_creation_partial=content_tagging_creation_partial, engine=engine, metadata=metadata, run_id=run_id)
        # job_3 = gevent.spawn(consumer, index=2, content_tagging_creation_partial=content_tagging_creation_partial, engine=engine, metadata=metadata, run_id=run_id)
        job_list.append(job_2)
        # job_list.append(job_3)
        gevent.joinall(job_list)

        # for _ in range(10):
        #     worker = threading.Thread(target=process_task, args=(task_queue,content_tagging_creation_partial, engine, metadata, run_id))
        #     # worker.daemon = True
        #     worker.start()


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


