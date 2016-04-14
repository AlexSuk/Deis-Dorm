$(document).ready(function(){
  // window.a=updateRangeValue;
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
  console.log('');
  input=$(input);
  var selectedColor = "#428bca";
  var nonSelectedColor = "#ddd"
  var value = input.val();
  var maximum = input.attr('max'); 
  var rangeLength = input.attr('max') - input.attr('min') + 1; 
  var inputWidth = input.width(); //323 width
  var background = getRangeGradient(selectedColor, nonSelectedColor, value, maximum);
  // console.log(input.width());
  var numLocation=(value/10)*(inputWidth-32);
  input.next('.text').css({'left': numLocation + 'px'});
  input.next('.text').css({'top': -10 + 'px'}); //circle radius + runnable track height
  input.next('.text').html(value);
  input.css('background', background); 
}