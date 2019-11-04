class Comment < ApplicationRecord
  validates :text, presence: true
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
end
