$(document).ready(function(){

  $('a[href]:not([target])').each(function(key, value) {
    var href = $(value).attr('href');
    if( href.match(/^http/i) || href.match(/^\/\//i) ) {
      $(value).attr('target', '_blank');
    }
  });

});
