from db_init import create_db_engine, init_db, create_tables
import sqlalchemy
from tagging import content_tagging 


def create_metadata(db_url: str):
    # db_url = "sqlite:///example.db"  # Replace with your actual database URL# Example MySQL URL
    engine = create_db_engine(db_url)
    
    init_db(engine)
    
    metadata = sqlalchemy.MetaData()

    return engine, metadata    

def input_select(engine, metadata, content_tagging_creation_partial):
    dwd_filtered_input = create_tables(metadata)
    
    # print("Tables created:", dwd_filtered_input.name)

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
            content_tagging_creation_partial(row.content)

# if __name__ == "__main__":
#     input_select()


