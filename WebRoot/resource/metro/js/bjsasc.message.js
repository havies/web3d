(function($) {
  $.fn.showPublish = function(options) {
    var settings = $.extend({}, {open: false}, options);
    var messageHTML="<div class='message_border'><div class='message_content'><textarea class='writein' ></textarea></div><div class='message_count' ><span>0</span>/<span>1000</span></div></div><div class='message_action'><ul ><li  class='file_icon'><a class='action_button'>文件/图片</a></li><li class='at_icon'><a  class='action_button'>同事</a></li><li class='atall_icon'><a  class='action_button'>所有同事</a></li></ul><span class='dropdown'><i>所有人可见</i></span><a title='发布' class='pub_cpsw disable_pub_cpsw' href='javascript:void(0);'><b><i>发布</i></b></a></div>";
    $(this).html(messageHTML);
  }
})(jQuery);