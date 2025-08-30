class User < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :profile_image


  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50 }

  
  
  def get_profile_image(width = nil, height = nil)
    if profile_image.attached?
      if width && height
        profile_image.variant(resize_to_limit: [width, height])
      else
        profile_image
      end
    else
      'no_image.jpg'
  end
end
end
