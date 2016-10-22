class AddUserRefToUserGroups < ActiveRecord::Migration[5.0]
  def change
    add_reference :user_groups, :user,index: true, foreign_key: true
  end
end
