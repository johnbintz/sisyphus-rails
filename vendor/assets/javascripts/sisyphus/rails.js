//= require sisyphus
//= require_self

$.sisyphus.railsRestore = function() {
  $('.sisyphus_status').show().find('button').unbind().click(function() {
    $.sisyphus().manuallyReleaseData();
    window.location.href = window.location.href;
    return false;
  });
};

