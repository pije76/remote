from django.contrib import admin

import tagulous.admin

from . import models

# Register your models here.
#admin.site.register(FreelancerProfile)
tagulous.admin.register(models.)
#admin.site.register(Skill)
#tagulous.admin.register(Skill, SkillAdmin)
#tagulous.admin.register(models.Skill)
#admin.site.register(Skill, SkillAdmin)
tagulous.admin.register(models.Skill)

