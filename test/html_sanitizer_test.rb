require File.dirname(__FILE__) + '/test_helper.rb' 

class HtmlSanitizerTest < ActiveSupport::TestCase
  load_schema
  
  # Our Mock class that we use to test the sanitization on
  class Mock < ActiveRecord::Base
    html_sanitizer :sanitize => [:mock_string, :mock_text]
  end
  
  test "has a Mock class initialized" do
    assert_nothing_raised("NameError"){ Mock.new }
  end
  
  test "should respond to html_sanitizer method" do
    assert_respond_to(Mock, :html_sanitizer)
  end
  
  test "should sanitize HTML in a string attribute" do
    mock = Mock.create(:mock_string => html_string)
    assert_equal mock.mock_string, non_html_string
  end
  
  test "should sanitize HTML in a text attribute" do
    mock = Mock.create(:mock_text => html_string)
    assert_equal mock.mock_text, non_html_string
  end
  
end