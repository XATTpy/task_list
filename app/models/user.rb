class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tasks, dependent: :destroy
  before_create :set_username

  def getusername
    email.split('@')[0].capitalize
  end

  def set_username
    self.username = getusername
  end

  def to_s
    username
  end
end
