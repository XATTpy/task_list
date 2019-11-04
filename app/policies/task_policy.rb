class TaskPolicy < ApplicationPolicy
  attr_accessor :error_message

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user.admin?
  end

  def destroy?
    true if (user.username == task.created_by) || (user.username == task.assignee)
  end

  def edit?
    true if (user.username == task.created_by) || (user.username == task.assignee)
  end

  private

  def task
    record
  end
end
