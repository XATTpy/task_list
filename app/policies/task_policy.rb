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
    if user.username == task.created_by or user.username == task.assignee
      return true
    end
  end

  def edit?
    if user.username == task.created_by or user.username == task.assignee
      return true
    end
  end

  private
  def task
    record
  end
end
