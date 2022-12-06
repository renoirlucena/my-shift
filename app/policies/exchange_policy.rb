class ExchangePolicy < ApplicationPolicy
 class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      user.admin? ? scope.all : scope.where(user: user)
    end
  end

  def show?
    true # todos podem ver o car
  end

  def new?
    true
  end

  def create?
    true # todos podem criar um car
  end

  def edit?
    owner?
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  private

  def owner?
    # verificar se o usuário do restaurate é o usuário logado
    # record = @request
    # record.user = @request.user
    # user = current_user
    record.user == user
  end
end
