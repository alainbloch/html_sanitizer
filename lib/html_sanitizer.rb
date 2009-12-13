# HtmlSanitizer
module HtmlSanitizer
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def html_sanitizer(options = {})
      before_save :sanitize_fields
      
      write_inheritable_attribute(:html_sanitizer_options, {
                                    :sanitize => (options[:sanitize] || []),
                                    :config   => (options[:config] || {})
                                  })
      
      class_inheritable_reader :html_sanitizer_options     
      include HtmlSanitizer::InstanceMethods
    end
  end
  
  module InstanceMethods
    def sanitize_fields
      return if html_sanitizer_options.nil?
      html_sanitizer_options[:sanitize].each do |value|
        self[value] = Sanitize.clean(self[value].to_s, html_sanitizer_options[:config])
      end
    end
  end

end