$(document).ready(function(){
  if(gon.cloud && gon.counter == 0) {
    gon.counter += 1
    $("#tag-cloud").jQCloud(gon.cloud, {
      width: 2750,
      height: 2000,
      removeOverflowing: true
    });
  }
});
