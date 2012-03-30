class BloggerAuthorization < MoulinRouge::Authorization
  role :editor do
    can :manage, [Post, Comment]
  end
  
  role :writer do
    can :manage, Post, :user_id => current_user.id
  end
end