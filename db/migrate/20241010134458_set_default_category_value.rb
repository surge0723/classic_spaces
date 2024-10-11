class SetDefaultCategoryValue < ActiveRecord::Migration[6.1]
  def up
    # 既存のレコードに対してデフォルト値を設定
    Space.where(category: nil).update_all(category: "未分類")
    
    # null: false 制約を追加
    change_column :spaces, :category, :string, null: false
  end

  def down
    # 制約を元に戻す
    change_column :spaces, :category, :string, null: true
  end
end