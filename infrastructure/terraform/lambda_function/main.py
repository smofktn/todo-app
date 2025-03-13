import json


def handler(event, context):
    response = {"statusCode": 200, "body": "Hello, Lambda!"}
    print("lambdaで実行しているはず")
    return response
