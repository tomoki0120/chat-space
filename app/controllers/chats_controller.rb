class ChatsController < ApplicationController

  def index
    @posts = Post.new
    @user = User.find(1)
  end

  def create
   Post.create(post_params)
   redirect_to :root
  end
  
  private
  def post_params
    params.require(:post).permit(:message,:text_image).merge(group_id: 1,user_id: 1)
  end
end
