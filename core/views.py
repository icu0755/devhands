import os
import random
import time

from django.core.cache import cache
from django.http import HttpResponse

from core.models import Post

random_data = os.urandom(128)


def main(request):
    return HttpResponse(b'Hello Django')


def cpu_usleep(request):
    cpu_ns = int(request.GET.get('cpu', 0)) * 1000
    sleep = int(request.GET.get('sleep', 0))

    start_time = time.process_time_ns()
    elapsed = 0
    while elapsed < cpu_ns:
        elapsed = time.process_time_ns() - start_time

    time.sleep(sleep)

    return HttpResponse(f'CPU Time {elapsed / 1000}')


ROWS_NUM = 95897


def from_db(request):
    times = int(request.GET.get('times', 0))
    for i in range(times):
        pk = random.randint(1, ROWS_NUM)
        Post.objects.get(pk=pk)
    return HttpResponse(f'Fetched {times} db rows')


def from_cache(request):
    times = int(request.GET.get('times', 0))
    for i in range(times):
        pk = random.randint(1, ROWS_NUM)
        cache.get(f'post_{pk}')
    return HttpResponse(f'Fetched {times} cache keys')


def from_cache_many(request):
    times = int(request.GET.get('times', 0))
    keys_to_fetch = []
    for i in range(times):
        pk = random.randint(1, ROWS_NUM)
        keys_to_fetch.append(f'post_{pk}')
    cache.get_many(keys_to_fetch)
    return HttpResponse(f'Fetched {times} cache keys (many)')
