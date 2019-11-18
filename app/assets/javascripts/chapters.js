(function ($) {
  $(document).on( 'turbolinks:load', function(){
    $('.sortable').railsSortable();
  });
})(jQuery);