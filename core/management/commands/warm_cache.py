from django.core.management.base import BaseCommand
from django.core.cache import cache
from core.models import Post


class Command(BaseCommand):
    help = 'Warms up memcache by caching Post objects'

    def handle(self, *args, **options):
        self.stdout.write("Warming up memcache...")

        # Fetch Post objects and cache them
        posts = Post.objects.all()

        for post in posts:
            cache_key = f'post_{post.pk}'
            cache.set(cache_key, post)

        self.stdout.write(self.style.SUCCESS("Memcache warmed up successfully"))
