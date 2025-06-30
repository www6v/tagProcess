# import sys
import os
import pymysql
import yaml
from pathlib import Path


def db(host:str, user:str, password:str, database:str):
    # 创建数据库连接
    db = pymysql.connect(
        host=host,
        user=user,
        password=password,
        database=database,
    )

    cursor = db.cursor()

    cursor.execute("SELECT * FROM your_table")

    results = cursor.fetchall()

    for row in results:
        print(row)

    print("数据库连接成功!")


if __name__ == "__main__":

    current_directory = os.getcwd()

    # yaml
    file_path = Path(current_directory) /'config/config.yaml'
    config_str = file_path.read_text()

    # f = open("/Users/wei.wang/workspaceWork/tagProcess/config/config.yaml", "r", encoding="utf-8")
    # config_str = f.read()
    # f.close()

    print(config_str)

    config = yaml.load(config_str, Loader=yaml.FullLoader)
    host = config["dsn"]["host"]
    username = config["dsn"]["username"]
    password = config["dsn"]["password"]
    database = config["dsn"]["database"]  

    prompt_path = config["prompt_path"] 


    db(host, username, password, database)

    # prompt
    p_path = Path(current_directory) /prompt_path   
    p_str = p_path.read_text()
    print(p_str)




