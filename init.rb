require 'html_sanitizer'
require 'sanitize'
ActiveRecord::Base.send(:include, HtmlSanitizer)