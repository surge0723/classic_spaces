class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
 devise authentication_keys: [:email] 
 
 module Admin
  # Adminモジュールの再定義を修正する
end
end
