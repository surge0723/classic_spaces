class ChangeCategoryToIntegerInSpaces < ActiveRecord::Migration[6.1]
  def change

    change_column :spaces, :category, :integer, null: false, default: 0 # 新しいカラムを追加
  end
end
