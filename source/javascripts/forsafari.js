$(document).ready(function(){

  if(navigator.userAgent.match(/Safari/i) && !navigator.userAgent.match(/Chrome/i)) {
    $('body').addClass('onsafari')
  }

});
