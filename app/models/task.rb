class Task < ApplicationRecord
    has_many :comments, as: :commentable
    belongs_to :user
    before_validation :set_user

    def set_user
        assigne = self.assigne
        user = User.find_by username: assigne
        self.user_id = user.id
    end
end
