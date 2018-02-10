class ElectionPolicy < ApplicationPolicy
  def index?
    user.admin?
  end
  
  def permitted_attributes_for_create
    [:year, :type_election]
  end

  def permitted_attributes_for_edit
    [:body, :type_election]
  end  
end