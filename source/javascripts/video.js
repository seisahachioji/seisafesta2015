var player;

$(document).ready(function(){

  var wrp = $('#video_video');
  var iframe = $('iframe', wrp);
  var shares = $('#video_share li', wrp);

  $(iframe).click(function(e){
    e.stopPropagation();
  });
  $(shares).click(function(e){
    e.stopPropagation();
  });

  $(wrp).click(function(e){
    $('>a[href]', wrp)[0].click();
  });

});


function onYouTubeIframeAPIReady() {
  player = new YT.Player('video_lp');

  player.addEventListener('onReady', function(){
    $('#video_video').attr('data-show', 'data-show');
    player.playVideo();
  });

  player.addEventListener('onStateChange', function(e){
    if(e.data == YT.PlayerState.ENDED)
      $('#video_video')[0].click();
  });
}
