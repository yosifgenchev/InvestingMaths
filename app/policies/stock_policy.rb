class StockPolicy < ApplicationPolicy
  attr_reader :user, :stock

  def initialize(user, stock)
  	       super(user, stock)

    # @user = user
    # @stock = stock
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