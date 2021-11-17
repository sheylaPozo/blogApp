class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role == 'admin'
      can :manage, :all
    else
      can :read, :all
      can :destroy, Comment do |comment|
        comment.user.id == user.id
      end

      can :destroy, Post do |post|
        post.user.id == user.id
      end
    end
  end

