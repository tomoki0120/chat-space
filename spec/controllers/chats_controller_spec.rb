require 'rails_helper'

describe ChatsController do
  describe 'GET #index' do

      let!(:test_user){create(:user,id:1)}
      let!(:test_group){create(:group,id:2)}

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end

    it "populates an array of @posts ordered by created_at DESC" do
      posts = create_list(:post,3,user: test_user,group:test_group)
      get :index
      expect(assigns(:posts)).to match(posts.sort{|a, b| b.created_at <=> a.created_at })
    end

    it "assigns the requested contact to @user" do
      get :index
      expect(assigns(:user)).to eq test_user
    end

    it "assigns the requested contact to @group" do
      get :index
      expect(assigns(:group)).to eq test_group
    end
  end


  describe 'POST #create' do

      let!(:test_user){create(:user,id:1)}
      let!(:test_group){create(:group,id:2)}

    it "redirect to :index(sucess)" do
      post :create, post: attributes_for(:post)
      expect(response).to redirect_to root_path
    end

    it "redirect to :index(failed)" do
      post :create, post: attributes_for(:post, message: nil)
      expect(response).to redirect_to root_path
    end

    it "saves the new contact in the database" do
      expect {post :create, post: attributes_for(:post,group: test_group,user: test_user)}.to change(Post, :count).by(1)
    end

    it "failed the new contact in the database" do
      expect {post :create, post: attributes_for(:post,message: nil,group: test_group,user: test_user)}.not_to change(Post, :count)
    end
  end
end
