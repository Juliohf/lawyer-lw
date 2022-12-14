class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user_type: "lawyer")
    end
  end

  def show?
    return true
  end
end
