class AddUserIdToSpaces < ActiveRecord::Migration[6.1]
  def change
     add_reference :spaces, :user, foreign_key: true, null: true
  end
end
