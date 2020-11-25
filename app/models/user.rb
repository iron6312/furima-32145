class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :password, :password_confirmation, confirmation: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :birthday, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :last_name, presence: true
  VALID_PASSWORD_REGEX = /\A[ァ-ヶー－]+\z/
  validates :first_name_kana, format: { with: VALID_PASSWORD_REGEX }
  VALID_PASSWORD_REGEX = /\A[ァ-ヶー－]+\z/
  validates :last_name_kana, format: { with: VALID_PASSWORD_REGEX }
  VALID_PASSWORD_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :first_name, format: { with: VALID_PASSWORD_REGEX }
  VALID_PASSWORD_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :last_name, format: { with: VALID_PASSWORD_REGEX }
end