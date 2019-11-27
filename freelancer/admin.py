from django.contrib import admin

from .models import FreelancerProfile, Skill

import tagulous.admin

# Register your models here.
class SkillAdmin(admin.ModelAdmin):
    list_display = ['title',]

admin.site.register(FreelancerProfile)
tagulous.admin.register(Skill, SkillAdmin)
#admin.site.register(Skill, SkillAdmin)
