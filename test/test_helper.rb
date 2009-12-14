require 'rubygems'
require 'active_support'
require 'active_support/test_case'
require 'config_test'

# Our Mock class that we use to test the sanitization on
class Mock < ActiveRecord::Base
  html_sanitizer :sanitize => [:mock_string, :mock_text]
end

def html_string
  %(<b>This will not be bolded.</b>)
end

def non_html_string
  %(This will be bolded.)
end