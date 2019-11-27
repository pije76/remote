from django.contrib import admin

#import tagulous.admin

from .models import FreelancerProfile, Skill

# Register your models here.
class SkillAdmin(admin.ModelAdmin):
    list_display = ['title',]

#tagulous.admin.register(Skill, SkillAdmin)
admin.site.register(Skill, SkillAdmin)
admin.site.register(FreelancerProfile)