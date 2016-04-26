// jQuery to collapse the navbar on scroll
function collapseNavbar() {
    if ($("#main-navi").offset().top > 50) {
        $(".navbar-default").addClass("top-nav-collapse");
        $(".navbar-default").addClass("navbar-fixed-top");
    } else {
        $(".navbar-default").removeClass("top-nav-collapse");
        $(".navbar-default").removeClass(".navbar-fixed-top");
    }
}

$(window).scroll(collapseNavbar);
$(document).ready(collapseNavbar);

// jQuery for page scrolling feature - requires jQuery Easing plugin
$(function() {
    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500, 'easeInOutExpo');
        event.preventDefault();
    });
});

// Closes the Responsive Menu on Menu Item Click
$('.navbar-collapse ul li a').click(function() {
  if ($(this).attr('class') != 'dropdown-toggle active' && $(this).attr('class') != 'dropdown-toggle') {
    $('.navbar-toggle:visible').click();
  }
});