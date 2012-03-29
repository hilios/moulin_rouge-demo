class GuestAuthorization < MoulinRouge::Authorization
  can :read,            Post
  can [:read, :create], Comment
end