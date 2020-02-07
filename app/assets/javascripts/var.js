/* side var */
$(function(){
  // 
  var duration = 300;

  // aside ----------------------------------------
  var $aside = $('.side__header > aside');
  var $asidButton = $aside.find('button')
      .on('click', function(){
          $aside.toggleClass('open'); /*届き*/
          if($aside.hasClass('open')){
              $aside.stop(true).animate({right: '-70px'}, duration, 'easeOutBack');
              $asidButton.find('img').attr('src', '/assets/btn_close.png');
          }else{
              $aside.stop(true).animate({right: '-390px'}, duration, 'easeInBack');
              $asidButton.find('img').attr('src', '/assets/btn_open.png');
          };
      });
});
