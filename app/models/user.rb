class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :order, dependent: :destroy

  before_save { email.downcase! }

   validates :email, presence: true, length: { maximum: 255 }, email: true,
                    format: /@/,
                    uniqueness: { case_sensitive: false }

                    
end
