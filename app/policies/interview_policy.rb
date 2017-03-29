class InterviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    true
  end

  def show?
    record.user == user || user.is_manager
    # scope.where(:id => record.id).exists?
  end

  def update?
    record.user == user
  end

  def edit_later?
    record.user == user
  end

  def create_pdf?
    record.user == user
  end

end
