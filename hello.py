def hello_app(environ, start_response):
    data = ''.join(format(ord(i), 'b') for i in environ['QUERY_STRING'].replace('&', '\n'))
    status = '200 OK'
    response_headers = [
        ('Content-type', 'text/plain'),
        ('Content-Length', str(len(data)))
    ]
    start_response(status, response_headers)
    return iter([data])
