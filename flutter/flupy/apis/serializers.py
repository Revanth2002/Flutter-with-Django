from rest_framework import serializers
from todoapp import models 

class TodoSerializer(serializers.ModelSerializer):
    class Meta:
        fields = (
            'id',
            'title',
            'description'
        )
        model = models.Todo