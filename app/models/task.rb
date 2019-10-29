class Task < ApplicationRecord
  belongs_to :admin
  has_many :comments, as: :commentable
end
