class ChangeCategoryToIntegerInSpaces < ActiveRecord::Migration[6.1]
  def change
    remove_column :spaces, :category, :string # まず、古いカラムを削除
    add_column :spaces, :category, :integer, null: false, default: 0 # 新しいカラムを追加
  end
end
