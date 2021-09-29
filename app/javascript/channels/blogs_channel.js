import consumer from "./consumer"
var blogsChannel;

$(document).on('turbolinks:load', function(){
  var comments = $('#comments');
  if(comments.length > 0){
    blogsChannel = consumer.subscriptions.create(
      {
        channel: "BlogsChannel",
        blog_id: comments.data('blog-id')
      }, 
      {
      connected() {
        // Called when the subscription is ready for use on the server
      },
    
      disconnected() {
        // Called when the subscription has been terminated by the server
      },
    
      received(data) {
        comments.append(data['content']);
      },

      send_comment(comment, blog_id){
        this.perform('send_comment', { comment: comment, blog_id: blog_id })
      }
    });
    
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var $this = $(this);
    var textarea = $this.find('#comment_content')
    if($.trim(textarea.val()).length > 1 && blogsChannel){
      blogsChannel.send_comment(textarea.val(), comments.data('blog-id'));
      textarea.val('');
    }
    return false;
  });
});