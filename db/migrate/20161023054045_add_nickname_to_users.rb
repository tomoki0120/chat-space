class AddNicknameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :Nickname, :string
  end
end
