class AdminAuthorization < MoulinRouge::Authorization
  role :admin do
    can :manage, :all
  end
end