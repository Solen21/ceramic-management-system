import os

class Config:
    SECRET_KEY = 'your_super_secret_key'
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:@localhost/ceramic_management_system'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
