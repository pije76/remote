from django import template

register = template.Library()

@register.filter
def get_name(value):
    spam = value.split('/')[-1]         # assume value be /python/web-scrapping

@register.simple_tag
def last_child(node):
    children = node.get_children()
    if children:
        return list(children)[-1]
    else:
        return ""