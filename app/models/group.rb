class Group < ApplicationRecord
      belongs_to :owner, class_name: 'User'
      has_many :group_users, dependent: :destroy
      has_many :users, through: :group_users, source: :user      
  validates :name, presence: true
  validates :introduction, presence: true
  validates :condition, presence: true

  def self.search_for(content, method)
    if method == 'perfect'
      Group.where(name: content)
    elsif method == 'forward' 
      Group.where('name LIKE ?', content+'%')
    elsif method == 'backward'
      Group.where('name LIKE ?', '%'+content)
    else
      Group.where('name LIKE ?', '%'+content+'%')
    end
  end

  def is_owned_by?(user)
    owner.id == user.id
  end
  
  def includesUser?(user)
    group_users.exists?(user_id: user.id)
  end
end
