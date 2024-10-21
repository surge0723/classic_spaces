class Space < ApplicationRecord
    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :favorite_posts, through: :favorites, source: :space
    has_many :comments, dependent: :destroy
    
    enum payment: { 当日精算: 0, 事前払込: 1, 銀行振込: 2 }
    enum category: { 大区分（オーケストラ練習）: 0, 中区分（セクション練習）: 1, 小区分（パート練習）: 2 }
    
    validates :space, :place, :facility, :price, :category, :payment, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    
    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
end
