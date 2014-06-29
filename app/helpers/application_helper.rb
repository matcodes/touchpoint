module ApplicationHelper
  
  def is_active?(controller, klass, action)
    controller.class == klass && controller.action_name == action
  end
  
end
