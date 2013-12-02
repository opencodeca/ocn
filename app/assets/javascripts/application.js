//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require bootstrap
//= require_tree .
//= require turbolinks

$(document).on('click', '.reply', function(e){
  $(this).closest(".comment").find(".comment-form").removeAttr('hidden')
});

$(document).on('keydown', 'textarea', function(e) {
  if(e.keyCode == 13 && (e.metaKey || e.ctrlKey)) {
    e.preventDefault();
    $(this).closest('form').submit();
  }
});

$(document).on('click', '#btn-toggle-nav', function(e) {
	$(this).hasClass("open") ? showMenu() : hideMenu();
});

function showMenu() {
	$("body").removeClass("nav-close");
	$("body").addClass("nav-open");
	$("#btn-toggle-nav").removeClass("open");
	$("#btn-toggle-nav").addClass("close");

	$(document).on('click touchstart', hideMenu);
}

function hideMenu() {
	$("body").removeClass("nav-open");
	$("body").addClass("nav-close");
	$("#btn-toggle-nav").removeClass("close");
	$("#btn-toggle-nav").addClass("open");
	$(document).off('click touchstart', hideMenu);
}