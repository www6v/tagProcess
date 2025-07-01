import sqlalchemy

from sqlalchemy import create_engine

def create_db_engine(db_url: str) -> sqlalchemy.engine.Engine:
    engine = create_engine(db_url, echo=True)
    return engine

def init_db(engine: sqlalchemy.engine.Engine):
    # from orm import models  # Import models to ensure they are registered with the metadata

    metadata = sqlalchemy.MetaData()
    metadata.create_all(engine)


def create_tables(metadata: sqlalchemy.MetaData) -> sqlalchemy.Table:

    # person = sqlalchemy.Table(
    #     'person', metadata,
    #     sqlalchemy.Column('id', sqlalchemy.Integer, primary_key=True),  
    #     sqlalchemy.Column('name', sqlalchemy.String(50), nullable=False),
    #     sqlalchemy.Column('age', sqlalchemy.Integer, nullable=False)
    # )   

    dwd_filtered_input = sqlalchemy.Table(
        'dwd_filtered_input', metadata,
        sqlalchemy.Column('ids', sqlalchemy.String(100)),  
        sqlalchemy.Column('content', sqlalchemy.String(10000), nullable=False),
    )   


    return dwd_filtered_input