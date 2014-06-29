class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    omniauth = request.env["omniauth.auth"]
    token = omniauth['credentials']['token']
    auth = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if auth
      auth.auth_token = token
      auth.save!
      sign_in auth.user, :event => :authentication
      render :text => render_popup_callback(root_path), :type => :html, :layout => false
    elsif current_user
      auth = current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
      auth.auth_token = token
      auth.save!
      render :text => render_popup_callback(authentications_path), :type => :html, :layout => false
    else
      user = User.new
      user.apply_omniauth(omniauth)
      if user.save
        auth = user.authentications.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
        auth.auth_token = token
        auth.save!
        sign_in user, :event => :authentication
        render :text => render_popup_callback(root_path), :type => :html, :layout => false
      else
        session["devise.omniauth"] = omniauth.except('extra')
        render :text => render_popup_callback(new_user_registration_path), :type => :html, :layout => false
      end
    end
  end

  def passthru
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end
  
  def failure
    render :text => render_popup_callback(nil), :type => :html, :layout => false
  end
  
  protected

    def render_popup_callback(path)
      redirect = "window.opener.location = '#{path}'" unless path.nil?
      "<script type=\"text/javascript\">window.close();#{redirect}</script>"
    end

end
