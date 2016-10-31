class ChatsController < ApplicationController

  before_action :authenticate_user!

  def index
    @post = Post.new
    @posts = current_user.posts.order('created_at DESC')
    @group = Group.find(2)
  end

  def create
    post = Post.new(post_params)
    if post.save
      redirect_to :root,notice: '投稿されました！'
    else
      post.errors.full_messages.each do |error|
        flash[:alert] = error
      end
      redirect_to :root
    end
  end

  private
  def post_params
    params.require(:post).permit(:message,:text_image).merge(group_id: 2,user_id: current_user.id)
  end
end
