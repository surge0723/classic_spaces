class RenameBookIdToSpaceIdInComments < ActiveRecord::Migration[6.1]
  def change
    rename_column :comments, :book_id, :space_id
  end
end
