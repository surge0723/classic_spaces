class ChangeUserIdToSpacesNotNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :spaces, :user_id, false
  end
end

