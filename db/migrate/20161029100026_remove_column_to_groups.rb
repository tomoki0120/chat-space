class RemoveColumnToGroups < ActiveRecord::Migration[5.0]
  def change
    remove_reference :groups, :user, index: true,foreign_key: true
  end
end
