class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include ImageUploader::Attachment(:image)
  validates :name, presence: true
  has_many :categories
  has_many :deals
end
