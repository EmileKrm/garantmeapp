class OrganisationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.is_manager
        scope.all
      else
        raise Pundit::NotAuthorizedError
      end
    end
  end

  def initialize(user, record, student)
    @user = user
    @record = record
    @student = student
  end

  def show?
      @student.organisation_id == record.id
  end
end
