$(document).ready(function(){
  if(gon.user){
    $("#pref1").val(gon.user["pref_price"]);
    $("#pref2").val(gon.user["pref_clean"]);
    $("#pref3").val(gon.user["pref_size"]);
    $("#pref4").val(gon.user["pref_noise"]);
    $("#pref5").val(gon.user["pref_location"]);
    $("#pref6").val(gon.user["pref_ac"]);
    $('input[value=Single]').prop("checked",gon.user["single"]);
    $('input[value=Double]').prop("checked",gon.user["double"]);
    $('input[value=Triple]').prop("checked",gon.user["triple"]);
    $('input[value=Suite]').prop("checked",gon.user["suite"]);
  }

  $('input[type=range]').each(function(index,value){updateRangeValue(value)});
  $('input[type=range]').on('input change',function(){
    var input = $(this);
    updateRangeValue(input);
  });    
});
window.onresize=function(){
  $('input[type=range]').each(function(index,value){updateRangeValue(value)});  
}


function getRangeGradient(color1,color2,value,maximum){
  var gradient = "linear-gradient(to right, ";
  var breakPoint = (value/maximum)*100;
  var attrValue = gradient + color1 + " 0%, " + color1 + " " + breakPoint + "%, " + color2 + " " + breakPoint + "%, " + color2 + " 100%)";
  return attrValue;
}

function updateRangeValue(input){
  input=$(input);
  var selectedColor = "#428bca";
  var nonSelectedColor = "#ddd"
  var value = input.val();
  var maximum = input.attr('max'); 
  var rangeLength = input.attr('max') - input.attr('min') + 1; 
  var inputWidth = input.width(); //323 width
  var background = getRangeGradient(selectedColor, nonSelectedColor, value, maximum);
  var numLocation=(value/10)*(inputWidth-32);
  input.next('.text').css({'left': numLocation + 'px'});
  input.next('.text').css({'top': -10 + 'px'}); //circle radius + runnable track height
  input.next('.text').html(value);
  input.css('background', background); 
}