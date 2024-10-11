class AddCategoryToSpaces < ActiveRecord::Migration[6.1]
  def change
    add_column :spaces, :category, :integer
  end
end
