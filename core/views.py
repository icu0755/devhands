import os
import time

from django.http import HttpResponse

random_data = os.urandom(128)


def main(request):
    return HttpResponse(b'Hello Django')


def cpu_usleep(request):
    cpu_ns = int(request.GET['cpu_ns'])

    end_time = start_time = time.process_time_ns()
    while elapsed := (end_time - start_time) < cpu_ns:
        end_time = time.process_time_ns()

    return HttpResponse(f'CPU Time {elapsed}')
