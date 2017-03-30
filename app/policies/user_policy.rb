class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def edit?
    user == record
  end

  def update?
    user == record
  end

  def update_later?
    user == record
  end
end
