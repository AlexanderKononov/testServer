def hello_app(environ, start_response):
    body=environ['QUERY_STRING'].replace('?','')
    body=body.split('&')
    body = [bytes(i + '\n') for i in body]
    status = '200 OK'
    response_headers = [
        ('Content-type', 'text/plain')
    ]
    start_response(status, response_headers)
    return body
