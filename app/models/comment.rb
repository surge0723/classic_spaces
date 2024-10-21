class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :space
    
    enum category: { 評価: 0, 追加情報: 1, 改善点: 2, その他: 3 }
    
    validates :comment, presence: true
    validates :category, presence: true
end
