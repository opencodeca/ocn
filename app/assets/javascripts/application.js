//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require bootstrap
//= require_tree .
//= require turbolinks

$(document).on('click', '.reply', function(e){
  $(this).parents(".comment").first().find(".comment-form").removeAttr('hidden')
});
