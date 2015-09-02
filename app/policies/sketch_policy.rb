class SketchPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    !record.private? || user.present?
  end

  def destroy?
    user.present? && (record.user == user || user.admin?)
  end

end