$(document).ready(function() {
  var $showActionEl = $(".js-show-action");
  var $hideActionEl = $(".js-hide-action");

  $showActionEl.click(function(e) {
    e.preventDefault();
    $('.hidden-content').show();
    $showActionEl.hide();
    $hideActionEl.show();
  })

  $hideActionEl.click(function(e) {
    e.preventDefault();
    $('.hidden-content').hide();
    $hideActionEl.hide();
    $showActionEl.show();
  })
});
