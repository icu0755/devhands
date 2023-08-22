import os
import time

from django.http import HttpResponse

random_data = os.urandom(128)


def main(request):
    return HttpResponse(b'Hello Django')


def cpu_usleep(request):
    cpu_ns = int(request.GET['cpu_ns'])

    start_time = time.process_time_ns()
    elapsed = 0
    while elapsed < cpu_ns:
        elapsed = time.process_time_ns() - start_time

    return HttpResponse(f'CPU Time {elapsed}')
