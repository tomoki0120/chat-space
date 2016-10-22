class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text     :message
      t.text     :text_image
      t.references :group, index: true,foreign_key: true
      t.timestamps
    end
  end
end
