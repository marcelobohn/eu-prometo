class ManagerPolicy < ApplicationPolicy
  def index?
    user.admin?
  end
end