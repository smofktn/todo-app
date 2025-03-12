FROM public.ecr.aws/lambda/python:3.11

COPY requirements.txt ${LAMBDA_TASK_ROOT}

RUN pip install --no-cache-dir -r requirements.txt

COPY tmp_lambda_function.py ${LAMBDA_TASK_ROOT}

CMD [ "tmp_lambda_function.handler" ]
