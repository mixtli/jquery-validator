module ActionView
  module Helpers
    class FormBuilder
      def jquery_validators(options = {})
          fields = options.delete(:only)
          
          @object.class.validators.each do |v|
            if !fields || fields.include?(v.attributes.first)
              if validator = JqueryValidator.factory(v, self)
                options.deep_merge!(JqueryValidator.factory(v, self).validate_arguments)
              end
            end
          end
          js = options.to_json
          js.gsub!(/"\s*(function\(.*\})\s*\"/, '\1')
          code = %Q[
            <script>
            $(document).ready(function() {
              $("##{ActionController::RecordIdentifier.dom_id(@object, @object.new_record? ? :new : :edit)}").validate(#{js});
            });
            </script>
          ]
          code.html_safe
      end
    end
  end
end
