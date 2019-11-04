class UserPolicy < ApplicationPolicy
  attr_accessor :error_message

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    user.admin? && !user2.admin?
  end

  private

  def user2
    record
  end
end
