class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  
  with_options presence: true do

    validates :nickname           
    validates :email
    VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
    validates :password, length:{ minimum: 6}, format: { with: VALID_PASSWORD_REGEX}
    validates :birthday           

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/} do
      validates :family_name        
      validates :last_name          
    end

    with_options format: { with: /\A[ァ-ヶ]+\z/} do
      validates :family_name_kana   
      validates :last_name_kana     
    end
  
  end
    
end



