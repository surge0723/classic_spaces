class AddConditionToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :condition, :string
  end
end
