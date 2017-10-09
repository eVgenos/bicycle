class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can [:use, :read], Bicycle
    can :create, Suggestion
    can :manage, Bicycle, user_id: user.id
    can :manage, Suggestion, bicycle: { user_id: user.id }
  end
end
