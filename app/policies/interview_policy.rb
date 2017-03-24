class InterviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    true
  end

  def update?
    record.user == user
  end

  def edit_later?
    record.user == user
  end

end
