class DropSpaces < ActiveRecord::Migration[6.1]
  def change
    drop_table :spaces
  end
end
