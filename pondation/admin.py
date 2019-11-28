from django.contrib import admin

from .models import Menu, Carousel

# Register your models here.
class CarouselAdmin(admin.ModelAdmin):
    list_display = ('name', 'carouseltype', 'image', 'owner','published')
    list_filter = ['carouseltype','published']
    search_fields = ['name','description','link','owner__username']
    
admin.site.register(Carousel, CarouselAdmin)
admin.site.register(Menu)
