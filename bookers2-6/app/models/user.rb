class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,:validatable
  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favoring_books, through: :favorites, source: :book

  attachment :profile_image, destroy: false
  validates :name, presence: true, uniqueness: true,
                  length: {minimum: 2, maximum: 20}
  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :introduction, length: {maximum: 50}
end
