class Space < ApplicationRecord
    belongs_to :user
    enum payment: { 当日精算: 0, 事前払込: 1, 銀行振込: 2 }
    enum category: { 大区分（オーケストラ練習）: 0, 中区分（セクション練習）: 1, 小区分（パート練習）: 2 }
    
    validates :space, :place, :facility, :price, :category, :payment, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
