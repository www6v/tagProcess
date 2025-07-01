from db_init import create_db_engine, init_db, create_tables
import sqlalchemy


def input_select():
    # db_url = "sqlite:///example.db"  # Replace with your actual database URL
    db_url = "mysql+pymysql://artgent_user:ArtgentData789@rm-uf6mb1y1i2970r1goao.mysql.rds.aliyuncs.com/artgent"  # Example MySQL URL
    engine = create_db_engine(db_url)
    
    # Initialize the database and create tables
    init_db(engine)
    
    # Create tables using the metadata
    metadata = sqlalchemy.MetaData()
    dwd_filtered_input = create_tables(metadata)
    
    print("Tables created:", dwd_filtered_input.name)

    with engine.connect() as connection:
        # metadata.create_all(connection)
        
        # insert_query = dwd_filtered_input.insert().values(ids="1", content='{"a":"aValue"}')
        # connection.execute(insert_query)
        # connection.commit() 

        query = dwd_filtered_input.select()
        result = connection.execute(query)

        for row in result:
            # print(row)
            print(row.ids, row.content)

if __name__ == "__main__":
    input_select()


