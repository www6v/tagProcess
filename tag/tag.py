# import sys
from functools import partial
import os
# import pymysql
import yaml
from pathlib import Path
from ops import input_select
from ops import create_metadata
# from tagging import content_tagging 
from tagging import content_tagging_creation
import uuid


# def db(host:str, user:str, password:str, database:str):
#     # 创建数据库连接
#     db = pymysql.connect(
#         host=host,
#         user=user,
#         password=password,
#         database=database,
#     )

#     cursor = db.cursor()
#     cursor.execute("SELECT * FROM your_table")
#     results = cursor.fetchall()

#     for row in results:
#         print(row)

#     print("数据库连接成功!")


def config_get():
    current_directory = os.getcwd()

    # yaml
    file_path = Path(current_directory) /'config/config.yaml'
    config_str = file_path.read_text()


    print(config_str)

    config = yaml.load(config_str, Loader=yaml.FullLoader)
    # db
    host = config["dsn"]["host"]
    username = config["dsn"]["username"]
    password = config["dsn"]["password"]
    database = config["dsn"]["database"]  
    # prompt
    prompt_path = config["prompt_path"] 
    # qwenToken
    qwenToken = config["qwen_token"]
    # modelName
    modelName = config["model"]
    # db_url 
    db_url = config["db_url"]

    return current_directory,prompt_path,qwenToken,modelName, db_url

if __name__ == "__main__":
    current_directory, prompt_path, qwenToken, modelName, db_url = config_get()

    # prompt
    p_path = Path(current_directory) /prompt_path   
    prompt = p_path.read_text()
    print(prompt)

    engine,metadata = create_metadata(db_url)
    content_tagging_creation_partial = partial(content_tagging_creation, prompt ,qwenToken, modelName)

    run_id = uuid.uuid4()

    input_select(engine, metadata, content_tagging_creation_partial, run_id)

    # db(host, username, password, database)







