module ApplicationHelper
  def activate_if(condition, *args)
      args << 'active' if condition
      args
  end
  # Returns true if matchs the current controller name
  # For example:
  # 
  #   UsersController.index
  #   controller_is?(:users)            # => true
  #   controller_is?('users', 'other')  # => true
  #   
  #   PostsController.show
  #   controller_is?(:users)            # => false
  #
  # If a block is given yield with the first argument has the
  # result of the match. For example:
  #
  #   controller_is?(:admin) do |boolean|
  #     if boolean
  #       # Do something when true
  #     else
  #       # And another when false
  #     end
  #   end
  def controller_is?(*controllers, &block)
    has_value = controllers.map(&:to_s).include? params[:controller]
    return block_given? ? yield(has_value) : has_value
  end

  # Returns true if matchs the current action name
  # For example:
  # 
  #   UsersController.index
  #   action_is?(:users)            # => true
  #   action_is?('users', 'other')  # => true
  #   
  #   PostsController.show
  #   action_is?(:users)            # => false
  #
  # If a block is given yield with the first argument has the
  # result of the match. For example:
  #
  #   action_is?(:admin) do |boolean|
  #     if boolean
  #       # Do something when true
  #     else
  #       # And another when false
  #     end
  #   end
  def action_is?(*actions, &block)
    has_value = actions.map(&:to_s).include? params[:action]
    return block_given? ? yield(has_value) : has_value
  end
end