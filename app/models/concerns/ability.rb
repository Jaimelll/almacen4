
class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    # Define abilities for the passed in user here. For example:
    #
    user ||= AdminUser.new # guest user (not logged in)
   
      case user.categoria # a_variable is the variable we want to compare
         when 1
              can :manage, :all
            
         else
            can :read, ActiveAdmin::Page, :name =>"Dashboard"    
       end      
   
  end
end
