// $(document).on('turbolinks:load', function(){
//   var comments = $('#comments');
//   if(comments.length > 0){
//     App.global_chat = App.cable.subscriptions.create(
//       {
//         channel: "BlogsChannel",
//         blog_id: comments.data('blog-id')
//       }
//     )
//   }
// });