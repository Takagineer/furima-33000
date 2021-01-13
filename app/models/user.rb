class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname           ,presence: true
  validates :email              ,presence: true
  validates :encrypted_password ,presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/} do
  validates :family_name        ,presence: true
  validates :last_name          ,presence: true
  end
  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/} do
  validates :family_name_kana   ,presence: true
  validates :last_name_kana     ,presence: true
  end
  validates :birthday           ,presence: true



end
