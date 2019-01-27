class DividendPolicy < ApplicationPolicy
  attr_reader :user, :dividend

  def initialize(user, dividend)
  	       super(user, dividend)
  end

  def update?
       user.try(:admin?) || user.try(:moderator?)|| record.try(:user) == user
  end
  def destroy?
    user.role == 'admin' || record.user == user
  end

    class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end