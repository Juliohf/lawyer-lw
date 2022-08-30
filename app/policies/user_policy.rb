class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(type: :lawyer)
    end
  end

  def index?
    return true
  end

  def show?
    return true
  end
end
