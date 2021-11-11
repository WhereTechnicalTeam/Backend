

# from rest_framework import pagination

# class AlldataPagination(pagination.PageNumberPagination):
#     page_size = 2
#     page_size_query_param = 'page_size'
#     max_page_size = 3
#     page_query_param = 'p'
#     paginate_by = 10


from rest_framework import status
from rest_framework import pagination
from rest_framework.response import Response
from collections import OrderedDict

class AlldataPagination(pagination.PageNumberPagination):
    page_size = 20
    page_size_query_param = 'page_size'
    max_page_size = 50
    page_query_param = 'p'
    status = 200

    def get_paginated_response(self, data):
        response = Response(data)
        response['status'] = self.status
        response['count'] = self.page.paginator.count
        response['next'] = self.get_next_link()
        response['previous'] = self.get_previous_link()
        # return Response({"alldata": response})
        return response