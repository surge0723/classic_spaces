class FixNullNamesInUsers < ActiveRecord::Migration[6.1]
  def up
    # 既存のレコードで、nameがnullのものにデフォルト値を設定
    User.where(name: nil).update_all(name: "Guest")
  end
  def down
    # ロールバック時にデフォルト値を再度nullに戻す
    User.where(name: "Guest").update_all(name: nil)
  end
end
