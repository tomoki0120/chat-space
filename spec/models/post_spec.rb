require 'rails_helper'

describe Post do
  describe '#create' do

    it "is invalid without a message" do
      post = build(:post,message: nil)
      post.valid?
      expect(post.errors[:message]).to include("を入力してください")
    end

    it "is invalid without a text_image" do
      post = build(:post,text_image: nil)
      post.valid?
      expect(post.errors[:text_image]).to include("を入力してください")
    end

    it "is invalid" do
      post  = build(:post)
      post.valid?
      expect(post).to be_valid
    end

  end
end
