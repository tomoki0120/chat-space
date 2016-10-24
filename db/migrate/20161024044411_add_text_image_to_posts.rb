class AddTextImageToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :text_image, :text
  end
end
