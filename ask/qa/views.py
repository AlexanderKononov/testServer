from django.http import HttpResponse 
def test(request, *args, **kwargs):
    return HttpResponse('200 OK')
