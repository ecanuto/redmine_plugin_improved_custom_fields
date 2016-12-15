require 'redmine'
require 'redmine_improved_custom_fields/hooks'
require 'redmine_improved_custom_fields/issues_helper_patch'


Redmine::Plugin.register :redmine_improved_custom_fields do
  
  requires_redmine :version_or_higher => '3.2.0'
  
  name 'Redmine Improved Custom Fields plugin'
  description 'Redmine custom fields improvements.'
  version '0.0.1'
  url 'https://github.com/ecanuto/redmine_improved_custom_fields'
  author 'Everaldo Canuto'
  author_url 'https://github.com/ecanuto/'
end
