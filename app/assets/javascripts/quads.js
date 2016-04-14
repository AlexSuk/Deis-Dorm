console.log("SAY SOMETHING I'M GIVING UP ON YOU");

$(document).ready(function(){
    $("#sidebar").affix({
        offset: {
            top: 195
        }
    });
});

var $body   = $(document.body);
var navHeight = $('.navbar').outerHeight(true) + 10;

$body.scrollspy({
	target: '#leftCol',
	offset: navHeight
});
