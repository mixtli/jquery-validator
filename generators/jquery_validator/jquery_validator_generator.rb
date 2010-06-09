class JqueryValidatorGenerator < Rails::Generator::Base
  
  def initialize(*runtime_args)
    super
  end
  
  def manifest
    record do |m|

      m.directory File.join('public', 'javascripts')
      m.template 'jquery_validator.js',   File.join('public', 'javascripts', 'jquery_validator.js')
    end
  end
    
  protected
  
  def banner
    %{Usage: #{$0} #{spec.name}\nCopies jquery_validator.js to public/javascripts}
  end
  
end
