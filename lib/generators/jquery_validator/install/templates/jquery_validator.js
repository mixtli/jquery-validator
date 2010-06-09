jQuery.validator.addMethod("accepts", function(value, element) {
  return $('input[name=' + element.name + '][type=checkbox]').attr('checked');
}, "You must accept the terms and conditions");

jQuery.validator.addMethod("excludes", function(value, element, params) {
  return jQuery.inArray($(element).val(), params) == -1 
}, "Invalid Input");

jQuery.validator.addMethod("includes", function(value, element, params) {
  return jQuery.inArray($(element).val(), params) != -1 
}, "Invalid Input");

jQuery.validator.addMethod("matches", function(value, element, params) {
  return value.match(params);
}, "Invalid Input");

jQuery.validator.addMethod("nomatches", function(value, element, params) {
  return !value.match(params);
}, "Invalid Input");