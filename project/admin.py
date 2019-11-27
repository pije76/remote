from django.contrib import admin

from mptt.admin import MPTTModelAdmin, DraggableMPTTAdmin
#from treebeard.admin import TreeAdmin
#from treebeard.forms import movenodeform_factory
from suit.admin import SortableModelAdmin

from .models import Project, Category

# Register your models here.
#class CategoryAdmin(admin.ModelAdmin):
class CategoryAdmin(MPTTModelAdmin):
#class CategoryAdmin(TreeAdmin):
#	fields = ('title', 'slug',)
#	fields = ('title', 'slug', '_position', '_ref_node_id',)
##	form = movenodeform_factory(Category)
#	prepopulated_fields = {"slug": ("title",)}
	mptt_level_indent = 20
	list_display = ('title', 'slug')
#	list_editable = ('is_active',)
	prepopulated_fields = {"slug": ("title",)}
#	sortable = 'order'

#class ProjectAdmin(admin.ModelAdmin):
class ProjectAdmin(admin.ModelAdmin):
#class ProjectAdmin(TreeAdmin):
	list_display = ('title', 'category', 'project_owner', 'create_date')
	search_fields = ('title', 'description')
	list_filter = ('project_owner', 'create_date')
	prepopulated_fields = {"slug": ("title",)}

admin.site.register(Category, CategoryAdmin)
#admin.site.register(Category , MPTTModelAdmin) 
admin.site.register(Project, ProjectAdmin)
