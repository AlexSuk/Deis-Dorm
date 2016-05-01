
// $(document).ready(function(){
//     $("#sidebar").affix({
//         offset: {
//             top: 195
//         }
//     });
// });

// var $body   = $(document.body);
// var navHeight = $('.navbar').outerHeight(true) + 10;
//
// $('body').scrollspy({
// 	target: '#leftCol',
// 	offset: navHeight
// });

    // var loaded = function(){
    //
    //   // Use affix plugin
    //   $("#sidebar").affix({
    //     offset: { top: 280 }
    //   });
    //
    //   // Use Scrollspy
    //   $('body').scrollspy({ target: '#sidebar', offset: 200 });
    //
    // }
    // $(document).on("page:load ready", loaded);

$(document).ready(function() {
  $("#quad_new_comment input").keyup(function() {
		$.get($("#quad_new_comment").attr("action"), $("#quad_new_comment").serialize(),null,"script");
		return false;
	});

  var offset = 80;

  $('.navbar li a').click(function(event) {
      event.preventDefault();
      $($(this).attr('href'))[0].scrollIntoView();
      scrollBy(0, -offset);
  });

  $("#sidebar").affix({
    offset: { top: 280 }
  });
  console.log("INIT PAGE");

  // Use Scrollspy
  $('body').scrollspy({ target: '#sidebar', offset: 200 });

});

// var offset = 80;
//
// $('.navbar li a').click(function(event) {
//     event.preventDefault();
//     $($(this).attr('href'))[0].scrollIntoView();
//     scrollBy(0, -offset);
// });

// $(function() {
//   initPage();
// });
// $(window).bind('page:change', function() {
//   initPage();
// });
// function initPage() {
//   // Use affix plugin
//   console.log("SAY SOMETHING I'M GIVING UP ON YOU");
//   console.log("SAY SOMETHING I'M GIVING UP ON YOU");
//   console.log("SAY SOMETHING I'M GIVING UP ON YOU");
//   console.log("SAY SOMETHING I'M GIVING UP ON YOU");
//   console.log("SAY SOMETHING I'M GIVING UP ON YOU");
//   console.log("SAY SOMETHING I'M GIVING UP ON YOU");
//
//   $("#sidebar").affix({
//     offset: { top: 280 }
//   });
//   console.log("INIT PAGE");
//
//   // Use Scrollspy
//   $('body').scrollspy({ target: '#sidebar', offset: 200 });
// }
