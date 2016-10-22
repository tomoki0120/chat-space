class CreateUserGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :user_groups do |t|
      t.references :group, index: true, foreign_key: true
      t.timestamps
    end
  end
end
