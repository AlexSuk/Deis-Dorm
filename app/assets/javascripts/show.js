$(document).ready(function(){
  $(".text").css("position","absolute");	
  $(".text").css("text-align","center");	

  // $(".text").css("left","35");	
  // $(".text").css("top","25");	


  updateRangeValue($('input[type=range]'));
  $('input[type=range]').on('input change',function(){
    var input = $(this);
    updateRangeValue(input);
  });    
});
function getRangeGradient(color1,color2,value,maximum){
  var gradient = "linear-gradient(to right, ";
  var breakPoint = (value/maximum)*100;
  var attrValue = gradient + color1 + " 0%, " + color1 + " " + breakPoint + "%, " + color2 + " " + breakPoint + "%, " + color2 + " 100%)";
  return attrValue;
}
function updateRangeValue(input){
  var selectedColor = "#428bca";
  var nonSelectedColor = "#ddd"
  var value = input.val();
  var maximum = input.attr('max'); 
  var rangeLength = input.attr('max') - input.attr('min') + 1; 
  var inputWidth = input.width();
  
  //analyze here
  var background = getRangeGradient(selectedColor, nonSelectedColor, value, maximum);
  // var offLeft = ((value / maximum) * inputWidth - (((value / maximum) * inputWidth - inputWidth/2) / 100) * 5) + 5;
  // var offLeftAbs = value == maximum ? offLeft -15 : offLeft - 10;    
  // console.log(input.offset().left)
  // console.log(input.width() + "hello")

  console.log(input.width());
  var left=27+value/10*(315-27);
  input.next('.text').css({'left': left + 'px'});
  input.next('.text').css({'top': 17 + 'px'});
 
  //to here

  input.next('.text').html(value);
  input.css('background', background); 
}