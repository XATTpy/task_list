class CommentPolicy < ApplicationPolicy
  attr_accessor :error_message

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    user2 = User.find_by username: comment.commenter
    return true if user.admin? && (!user2.admin? || (user == user2))
  end

  def destroy?
    user2 = User.find_by username: comment.commenter
    return true if user.admin? && (!user2.admin? || (user == user2))
  end

  private

  def comment
    record
  end
end
