class ChatsController < ApplicationController

  before_action :authenticate_user!

  def index
    @post = Post.new
    @posts = Post.order('created_at DESC')
    @group = Group.find(2)
  end

  def create
    post = Post.new(post_params)
    if post.save
      redirect_to :root,success: '投稿されました！'
    else
      post.errors.full_messages.each do |error|
        flash[:warning] = error
      end
      redirect_to :root
    end
  end

  private
  def post_params
    params.require(:post).permit(:message,:text_image).merge(group_id: 2,user_id: 1)
  end
end
