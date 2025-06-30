# import sys
import pymysql
import yaml



def db(host:str, user:str, password:str, database:str):
    # 创建数据库连接
    db = pymysql.connect(
        host=host,
        user=user,
        password=password,
        database=database,
    )

    print("数据库连接成功!")


if __name__ == "__main__":

    f = open("/Users/wei.wang/workspaceWork/tagProcess/tag/config.yaml", "r", encoding="utf-8")
    config_str = f.read()
    f.close()

    print(config_str)

    config = yaml.load(config_str, Loader=yaml.FullLoader)
    host = config["dsn"]["host"]
    username = config["dsn"]["username"]
    password = config["dsn"]["password"]
    database = config["dsn"]["database"]  

    prompt_path = config["prompt_path"] 


    db(host, username, password, database)

    open(prompt_path, "r", encoding="utf-8")

