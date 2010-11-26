module JqueryValidator
  module Generators
  
    class InstallGenerator < Rails::Generators::Base
      desc 'Copies jquery_validator.js to public/javascripts'
      def install_javascript
        copy_file('jquery_validator.js', 'public/javascripts/jquery_validator.js')
      end
      def self.source_root
        File.join(File.dirname(__FILE__), 'templates')
      end
  
      def self.banner
        "rails generate jquery_validator"
      end
    end
  end
end
