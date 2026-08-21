# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      can :read, Item
    elsif user.admin?
     can :manage, :all
    else
      can [ :read, :create ], Item
      can [ :update, :destroy ], Item, user: user
      can :manage, User, user: user
    end
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
