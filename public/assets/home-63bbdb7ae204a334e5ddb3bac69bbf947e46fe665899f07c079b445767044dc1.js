$(document).ready(function(){
  if(gon.cloud && gon.counter == 0) {
    gon.counter += 1
    console.log("jQCloud working?");
    console.log("jQClofesfsfesa");
    $("#tag-cloud").jQCloud(gon.cloud, {
      width: 2000,
      height: 1000,
      removeOverflowing: true
    });
  }
});
