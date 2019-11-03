class CommentPolicy < ApplicationPolicy
    attr_accessor :error_message
  
    class Scope < Scope
      def resolve
        scope.all
      end
    end

    def edit?
        user2 = User.find_by username: comment.commenter
        if user.admin? and (not user2.admin? or user == user2)
            return true
        end
    end

    def destroy?
        user2 = User.find_by username: comment.commenter
        if user.admin? and (not user2.admin? or user == user2)
            return true
        end
    end

    private
    def comment
      record
    end
end
