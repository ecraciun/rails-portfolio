class BlogsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "blogs_#{params['blog_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_comment(data)
    #puts "Creating comment for blog id #{data['blog_id']} -> #{data['comment']} "
    current_user.comments.create!(content: data['comment'], blog_id: data['blog_id'])
  end
end
