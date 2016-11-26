class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:edit,:update]


  def index
    @groups = Group.order('created_at DESC')
  end

  def new
    @group = Group.new
    gon.users = User.order('created_at DESC')
  end


  def create
    group = Group.new(group_params)
    if group.save
        redirect_to group_chats_path(group),notice:'グループが作成されました'
      else
        group.errors.full_messages.each do |error|
          flash[:alert] = error
        end
        redirect_to action: "new"
      end
  end


  def edit
    @members = @group.users
  end

  def update
    if @group.update(group_params)
        redirect_to  group_chats_path(@group),notice: 'グループが編集された'
      else
        group.errors.full_messages.each do |error|
          flash[:alert] = error
        end
        redirect_to action: "edit"
      end
  end

  private
  def group_params
    params.require(:group).permit(:group_name,{:user_ids => []})
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:group_name,{user_ids: []})
  end

end
