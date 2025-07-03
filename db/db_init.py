import sqlalchemy

from sqlalchemy import create_engine


def create_db_engine(db_url: str) -> sqlalchemy.engine.Engine:
    engine = create_engine(db_url, echo=True)
    return engine

def init_db(engine: sqlalchemy.engine.Engine):
    # from orm import models  # Import models to ensure they are registered with the metadata

    metadata = sqlalchemy.MetaData()
    metadata.create_all(engine)


def create_input_tables(metadata: sqlalchemy.MetaData) -> sqlalchemy.Table:

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
        extend_existing=True
    )   


    return dwd_filtered_input


def create_validate_tables(metadata: sqlalchemy.MetaData) -> sqlalchemy.Table:
    validated_success_data = sqlalchemy.Table(
        'validated_success_data', metadata,
        sqlalchemy.Column('id', sqlalchemy.INTEGER, primary_key=True, autoincrement=True),  
        sqlalchemy.Column('run_id', sqlalchemy.String(10000), nullable=True),
        sqlalchemy.Column('openai_id', sqlalchemy.String(10000), nullable=True),
        sqlalchemy.Column('prompt_tokens', sqlalchemy.INTEGER, nullable=True),
        sqlalchemy.Column('completion_tokens', sqlalchemy.INTEGER, nullable=True),
        sqlalchemy.Column('total_tokens', sqlalchemy.INTEGER, nullable=True),
        sqlalchemy.Column('model', sqlalchemy.String(10000), nullable=True),
        sqlalchemy.Column('created', sqlalchemy.TIMESTAMP, nullable=True),
        sqlalchemy.Column('content', sqlalchemy.String(10000), nullable=True),
        sqlalchemy.Column('finish_reason', sqlalchemy.String(10000), nullable=True),
        sqlalchemy.Column('data_id', sqlalchemy.String(10000), nullable=True),
        sqlalchemy.Column('prompt', sqlalchemy.String(10000), nullable=True),
        sqlalchemy.Column('source_response', sqlalchemy.String(10000), nullable=True),
        sqlalchemy.Column('start_request_time', sqlalchemy.TIMESTAMP, nullable=True),
        sqlalchemy.Column('end_request_time', sqlalchemy.TIMESTAMP, nullable=True) , 
        extend_existing=True              
    )   

    return validated_success_data


def create_dwd_issue_tables(metadata: sqlalchemy.MetaData) -> sqlalchemy.Table:
    dwd_issue = sqlalchemy.Table(
        'dwd_issue', metadata,
        sqlalchemy.Column('ids', sqlalchemy.String(10000), nullable=True),  
        sqlalchemy.Column('content', sqlalchemy.String(10000), nullable=True),
        extend_existing=True              
    )   

    return dwd_issue


def create_dwd_refined_tag_tables(metadata: sqlalchemy.MetaData) -> sqlalchemy.Table:
    dwd_refined_tag = sqlalchemy.Table(
        'dwd_refined_tag', metadata,
        sqlalchemy.Column('id', sqlalchemy.INTEGER, primary_key=True, autoincrement=True),          
        sqlalchemy.Column('biz_type', sqlalchemy.String(10000), nullable=True),  
        sqlalchemy.Column('biz_type_index', sqlalchemy.String(10000), nullable=True),
        sqlalchemy.Column('refined_tag', sqlalchemy.String(10000), nullable=True),
        extend_existing=True              
    )   

    return dwd_refined_tag