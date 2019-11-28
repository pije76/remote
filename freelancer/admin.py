from django.contrib import admin

import tagulous.admin

from . import models

# Register your models here.
class FreelancerProfileAdmin(admin.ModelAdmin):
    list_display = ('username', 'category', 'skill', 'rate')
    list_filter = ('username', 'category', 'skill', 'rate')

#admin.site.register(FreelancerProfile)
tagulous.admin.register(models.FreelancerProfile, FreelancerProfileAdmin)
#admin.site.register(Skill)
#tagulous.admin.register(Skill, SkillAdmin)
#tagulous.admin.register(models.Skill)
#admin.site.register(Skill, SkillAdmin)
tagulous.admin.register(models.Skill)

