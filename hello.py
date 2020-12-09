def hello_app(environ, start_response):
    body = [bytes(i + '\n', 'ascii') for i in environ['QUERY_STRING'].split('&')]
    status = '200 OK'
    response_headers = [
        ('Content-type', 'text/plain')
    ]
    start_response(status, response_headers)
    return body
