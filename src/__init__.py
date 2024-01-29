from time import sleep
from dagster import Definitions, op, job, in_process_executor

sleep(10)

@op
def not_much():
    return

@job
def parallel_job():
    for i in range(10):
        not_much.alias("not_much_" + str(i))()

definitions = Definitions(
    executor=in_process_executor,
    jobs=[parallel_job]
)
