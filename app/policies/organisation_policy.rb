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
end
