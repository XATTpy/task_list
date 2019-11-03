class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tasks, dependent: :destroy
  before_save :set_username

  def get_username
    return self.email.split('@')[0].capitalize
  end

  def set_username
    self.username = get_username
  end

  def to_s
    self.username
  end
end
