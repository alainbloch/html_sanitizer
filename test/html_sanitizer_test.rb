require 'test_helper'

class HtmlSanitizerTest < ActiveSupport::TestCase
  
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
  
  test "has a Mock class initialized" do
    assert_nothing_raised("NameError"){ Mock.new }
  end
  
  test "will sanitize HTML from a string attribute" do
    mock = Mock.create(:mock_string => html_string)
    assert_equal mock.mock_string, non_html_string
  end
  
  test "will sanitize HTML from a text attribute" do
    mock = Mock.create(:mock_text => html_string)
    assert_equal mock.mock_text, non_html_string
  end
  
end
