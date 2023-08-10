import random
from datetime import datetime, timedelta

from django.core.management.base import BaseCommand
from django.utils.crypto import get_random_string

from core.models import Author, Post


class Command(BaseCommand):
    help = 'Populate the database with 100,000 blog posts and authors'

    def handle(self, *args, **kwargs):
        authors = []
        for i in range(100):
            author = Author.objects.create(name=f'Author {i}')
            authors.append(author)

        for _ in range(100000):
            random_author = random.choice(authors)
            title = get_random_string(50)
            content = get_random_string(500)
            created_at = datetime.now() - timedelta(days=random.randint(0, 365))
            Post.objects.create(title=title, content=content, author=random_author, created_at=created_at)