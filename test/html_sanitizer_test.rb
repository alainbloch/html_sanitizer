require File.dirname(__FILE__) + '/test_helper.rb' 

class HtmlSanitizerTest < ActiveSupport::TestCase
  load_schema
  
  test "has a Mock class initialized" do
    assert_nothing_raised("NameError"){ Mock.new }
  end
  
  test "should sanitize HTML from a string attribute" do
    mock = Mock.create(:mock_string => html_string)
    assert_equal mock.mock_string, non_html_string
  end
  
  test "should sanitize HTML from a text attribute" do
    mock = Mock.create(:mock_text => html_string)
    assert_equal mock.mock_text, non_html_string
  end
  
end