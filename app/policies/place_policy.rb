# frozen_string_literal: true

class PlacePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.admin? ? scope.all : scope.where(active: true)
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    manage?
  end

  def create?
    manage?
  end

  def edit?
    manage?
  end

  def update?
    manage?
  end

  def destroy?
    manage?
  end

  private

  def manage?
    user && user.admin?
  end
end
