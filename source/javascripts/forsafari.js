$(document).ready(function(){

  if(navigator.userAgent.match(/Safari/i) && !navigator.userAgent.match(/Chrome/i)) {
    $('body').addClass('onsafari');
  }

  if( navigator.userAgent.match(/like Mac OS X/i) ) {
    $('body').addClass('onios');
  }

  if( navigator.userAgent.match(/OS 7_.+? like Mac OS X/i) ) {
    $('body').addClass('onios7');
  }

});
