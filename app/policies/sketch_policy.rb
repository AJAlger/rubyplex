class SketchPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
  end

  def destroy?
    user.present? && (record.user == user || user.admin?)
  end

end