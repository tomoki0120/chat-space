class ChatsController < ApplicationController


  def index
    @post = Post.new
    @group = Group.find(params[:group_id])
    @posts = @group.posts.order('created_at DESC')
    @groups = Group.order('created_at DESC')
  end

  def create
    post = Post.new(post_params)
      if post.save
        respond_to do |format|
         format.html {redirect_to action: "index",notice: '投稿されました！'}
         format.json {render json:{
           name: post.user.nickname,
           date: post.created_at.strftime("%Y年 %m月 %d日"),
           message: post.message,
           photo: post.text_image
           }}
         end
      else
        post.errors.full_messages.each do |error|
          flash[:alert] = error
        end
        redirect_to action: "index"
      end
  end

  private
  def post_params
    params.require(:post).permit(:message,:text_image).merge(group_id: params[:group_id],user_id: current_user.id)
  end

end
