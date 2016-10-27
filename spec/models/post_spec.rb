require 'rails_helper'

describe Post do
  describe '#create' do
    it "is vaild to save if you have all column" do
      user = create(:user)
      group = create(:group,user_id: user.id)
      post  = create(:post,:message,:text_image,user: user,group: group)
      expect(post).to be_valid
    end

    it "is invalid without a message" do
      user = create(:user)
      group = create(:group,user_id: user.id)
      post = build(:post,:text_image,user: user,group: group)
      post.valid?
      expect(post.errors[:message]).to include("を入力してください")
    end
  end
end
