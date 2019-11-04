class Task < ApplicationRecord
    has_many :comments, as: :commentable
    belongs_to :user
    before_validation :set_user
    validates :subject, presence: true

    def set_user
        assignee = self.assignee
        user = User.find_by username: assignee
        self.user_id = user.id
    end
end
