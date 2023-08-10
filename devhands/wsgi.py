"""
WSGI config for devhands project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/4.2/howto/deployment/wsgi/
"""

import os

from django.core.wsgi import get_wsgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'devhands.settings')

django_application = get_wsgi_application()


def application(env, start_response):
    if env['PATH_INFO'] == '/plain_wsgi':
        start_response('200 OK', [('Content-Type', 'text/plain')])
        return [b'Hello Plain WSGI']
    return django_application(env, start_response)
