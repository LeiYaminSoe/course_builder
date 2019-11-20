$(document).ready(function(){
  change_content();
  //alert("hi");
  //$(".content_content").removeClass('error');
  $("#new_content").find('.field_with_errors').removeClass("field_with_errors");
  //$("#new_content").find('.error').removeClass("field_with_errors");
  $('.error').remove(); 
});

function change_content(){
  //alert("hoooo");
  var contentType = $('#content_content_type :selected').val();
  if(typeof contentType == "undefined" || contentType == '' || contentType == null){
    contentType = 1;
  }
  if(contentType == 1){
    $("#content-summernote").show();
    $("#content-html").hide();
    $("#content-audio").hide();
    $("#content-video").hide();
    $("#content-pdf").hide();
  }
  else if(contentType == 2){
    $("#content-summernote").hide();
    $("#content-html").show();
    $("#content-audio").hide();
    $("#content-video").hide();
    $("#content-pdf").hide();
  }
  else if(contentType == 3){
    $("#content-summernote").hide();
    $("#content-html").hide();
    $("#content-audio").show();
    $("#content-video").hide();
    $("#content-pdf").hide();
  }
  else if(contentType == 4){
    $("#content-summernote").hide();
    $("#content-html").hide();
    $("#content-audio").hide();
    $("#content-video").show();
    $("#content-pdf").hide();
  }
  else{
    $("#content-summernote").hide();
    $("#content-html").hide();
    $("#content-audio").hide();
    $("#content-video").hide();
    $("#content-pdf").show();
  }
}; 