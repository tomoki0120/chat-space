require 'rails_helper'

describe Post do
  describe '#create' do

    it "is vaild to save if you have all column" do
      post  = build(:post)
      post.valid?
      expect(post.errors).to include()
    end

    it "is invalid without a message" do
      post = build(:post,message: nil)
      post.valid?
      expect(post.errors[:message]).to include("を入力してください")
    end

    it "is nothing to do with a text_image" do
      post = build(:post,text_image:nil)
      post.valid?
      expect(post.errors[:text_image]).to include()
    end

  end
end
