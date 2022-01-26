class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :encrypted_password, presence: true, length: { minimum: 6 }
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ンー-龥]/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ンー-龥]/ }
  validates :family_name_kana, presence: true, format: { with: /\A[ァ-ヶー-]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー-]+\z/ }
  validates :birth_day, presence: true
  
end
