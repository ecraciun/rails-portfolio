class CommentBroadcastJob < ApplicationJob
  queue_as :default

  def perform(comment)
    temp = render_comment(comment)
    channel = "blogs_#{comment.blog.id}_channel"
    # puts "###################### #{temp}"
    # puts "%%%%%%%%%%%% #{channel}"
    ActionCable.server.broadcast "blogs_#{comment.blog.id}_channel", { content: temp }
  end

  private

  def render_comment(comment)
    CommentsController.render partial: 'comments/comment', locals: { comment: comment }
  end
end
