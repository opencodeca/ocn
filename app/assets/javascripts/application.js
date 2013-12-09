//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require jquery.autosize
//= require_tree .
//= require turbolinks

$(document).on('click', '.reply', function(e){
	$(this).closest(".comment").find(".comment-form").removeAttr('hidden');
});

$(document).on('keydown', 'textarea', function(e) {
  if(e.keyCode == 13 && (e.metaKey || e.ctrlKey)) {
    e.preventDefault();
    $(this).closest('form').submit();
  }
});

$(document).on('click', '#btn-toggle-nav', function(e) {
	$('body').hasClass("nav-close") ? showMenu() : hideMenu();
});

function showMenu() {
	$("body").removeClass("nav-close");
	$("body").addClass("nav-open");
	$(document).on('click touchstart', hideMenu);
}

function hideMenu() {
	$("body").removeClass("nav-open");
	$("body").addClass("nav-close");
	$(document).off('click touchstart', hideMenu);
}

$(function(){
  $('#comment_comment, #post_description').autosize();
})
