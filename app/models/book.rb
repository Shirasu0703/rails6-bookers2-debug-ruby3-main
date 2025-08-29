class Book < ApplicationRecord
  belongs_to :user

  belongs_to :user
  belongs_to :book
  has_many :favorites, deoendent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length:{maximum:200}


  def fovorited_bu?(user)
    favorites.exists?(user_id: user.id)
  
  
end
