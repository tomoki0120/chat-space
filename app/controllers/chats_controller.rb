class ChatsController < ApplicationController

  def index
    @post = Post.new
    @posts = Post.order('created_at DESC')
    @user = User.find(1)
    @group = Group.find(2)
  end

  def create
    post = Post.new(post_params)
    if post.save
      redirect_to :root,success: 'Upadate Complete'
    else
      redirect_to :root,warning: 'Not complete'
    end
  end

  private
  def post_params
    params.require(:post).permit(:message,:text_image).merge(group_id: 2,user_id: 1)
  end
end
