def plugin_dir
  @plugin_dir ||= File.dirname(__FILE__)
end

require 'rubygems'
require 'active_support'
require 'active_support/test_case'
require plugin_dir + '/load_schema.rb'

def html_string
  %(<b>This will not be bolded.</b>)
end

def non_html_string
  %(This will not be bolded.)
end

