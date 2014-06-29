class AuthenticationsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @authentications = current_user.authentications
  end

  def destroy
    authentication = current_user.authentications.find(params[:id])
    authentication.destroy
    flash[:success] = "Successfully unlinked auth"
    redirect_to authentications_path
  end

end
