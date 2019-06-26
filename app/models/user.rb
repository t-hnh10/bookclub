class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :book_list_items
  has_many :books, through: :book_list_items

  has_many :reviews

  validates :username, uniqueness: true

  def name
    return username ? username : email
  end
end
