require 'issue_patch'

Redmine::Plugin.register :churt do
  name 'Churt plugin'
  author 'Roman Brodetski'
  description 'show close/open ratio'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
  permission :churt, { :churts => [:index] }, :public => true
  menu :project_menu, :churt, { :controller => 'churts', :action => 'index' }, :caption => 'Чарты', :after => :activity, :param => :project_id

  Rails.configuration.to_prepare do
    Issue.send(:include, IssuePatch)
  end
end
