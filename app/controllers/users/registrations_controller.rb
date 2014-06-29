class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super
    session["devise.omniauth"] = nil unless @user.new_record?
  end
  
  private
  
    def build_resource(*args)
      super
      if session["devise.omniauth"]
        @user.apply_omniauth(session["devise.omniauth"])
        @user.valid?
      end
    end
end