class AddNullFalseToSpace < ActiveRecord::Migration[6.1]
  def change
    change_column :spaces, :space, :string, null: false
    change_column :spaces, :place, :string, null: false
    change_column :spaces, :facility, :string, null: false
    change_column :spaces, :price, :integer, null: false
    change_column :spaces, :payment, :integer, null: false
    change_column :spaces, :payment, :integer, null: false
    change_column :spaces, :category, :integer, null: false
    
  end
end
