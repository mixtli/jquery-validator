module JqueryValidator
  class Base
    def initialize(builder, validator)
      @builder, @validator = builder, validator
    end
    
    def validate_arguments
      {}
    end
    
    def attributes
      @validator.attributes
    end
    
  end
  
  def self.factory(v, builder)
    klass = v.class.to_s.split("::").last
    klass = "JqueryValidator::#{klass}"
    klass.constantize.new(builder, v)
  rescue =>e
    # No matching validator exists.  
    #Rails.logger.debug e.message
    nil
  end
  
  class PresenceValidator < JqueryValidator::Base
    def validate_arguments
      {:rules => {"#{@builder.object_name}[#{@validator.attributes.first}]" =>  {'required' => true}}}
    end
  end
  
  class AcceptanceValidator < JqueryValidator::Base
    def validate_arguments
      field = "#{@builder.object_name}[#{@validator.attributes.first}]"
      { :rules => { field =>  {:accepts => true}} }
    end
  end

  class ConfirmationValidator < JqueryValidator::Base
    def validate_arguments
      field = "#{@builder.object_name}[#{@validator.attributes.first}_confirmation]"
      { :rules => { field =>  {:equalTo => "##{@builder.object_name}_#{@validator.attributes.first}"}} }
    end
  end
  
  class ExclusionValidator < JqueryValidator::Base
    def validate_arguments
      field = "#{@builder.object_name}[#{@validator.attributes.first}]"
      { :rules => { field =>  {:excludes => @validator.options[:in] }}}
    end
  end  

  class InclusionValidator < JqueryValidator::Base
    def validate_arguments
      field = "#{@builder.object_name}[#{@validator.attributes.first}]"
      { :rules => { field =>  {:includes => @validator.options[:in] }}}
    end
  end
  
  class LengthValidator < JqueryValidator::Base
    def validate_arguments
      field = "#{@builder.object_name}[#{@validator.attributes.first}]"
      args = {:rules => {field => {}}}
      args[:rules][field][:minlength] = @validator.options[:minimum] if @validator.options[:minimum]
      args[:rules][field][:maxlength] = @validator.options[:maximum] if @validator.options[:maximum]
      args
    end
  end

  class NumericalityValidator < JqueryValidator::Base
    def validate_arguments
      field = "#{@builder.object_name}[#{@validator.attributes.first}]"
      args = {:rules => {field => {:number => true}}}
      args[:rules][field][:min] = @validator.options[:greater_than_or_equal_to] if @validator.options[:greater_than_or_equal_to]
      args[:rules][field][:max] = @validator.options[:less_than_or_equal_to] if @validator.options[:less_than_or_equal_to]
      args[:rules][field][:digits] = true if @validator.options[:only_integer]
      args 
    end
  end
  
  class FormatValidator < JqueryValidator::Base
    def validate_arguments
      field = "#{@builder.object_name}[#{@validator.attributes.first}]"
      args = {:rules => {field => {}}}
      args[:rules][field][:matches] = @validator.options[:with].source if @validator.options[:with]
      args[:rules][field][:nomatches] = @validator.options[:without].source if @validator.options[:without]
      args
    end
  end

  
end
