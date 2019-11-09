from django.core.files.storage import FileSystemStorage
from django.conf import settings
import os

class OverwriteStorage(FileSystemStorage):

	def get_available_name(self, name, max_length=None):
#	def get_available_name(self, name):
		if self.exists(name):
#            os.remove(os.path.join(settings.MEDIA_ROOT, name))
			self.delete(name)
		return name