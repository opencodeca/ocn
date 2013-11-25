//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require bootstrap
//= require_tree .
//= require turbolinks

$(document).on('click', '.reply', function(e){
  $(this).parent().parent().find(".comment-form").first().removeAttr('hidden')
});
