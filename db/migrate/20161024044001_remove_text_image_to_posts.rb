class RemoveTextImageToPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :text_image, :text
  end
end
