$(document).ready(function(){
    $("#content-summernote").show();
    $("#content-html").hide();
    $("#content-audio").hide();
    $("#content-video").hide();
    $("#content-pdf").hide();
});
(function ($) {
  //$('#content_content').summernote();
  //$('.dropdown-toggle').dropdown();
  

    /* $('#content_content').summernote({
      // unfortunately you can only rewrite
      // all the toolbar contents, on the bright side
      // you can place uploadcare button wherever you want
      toolbar: [
        ['style', ['style']]
        ['insert', ['media', 'link', 'hr', 'audio', 'video', 'picture']]
        
      ]
    }); */
})(jQuery);

function change_content(){
  var contentType = $('#content_type :selected').val();
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