class SessionsController < ApplicationController
  def create
  	raise request.env["omniauth.auth"].to_yaml
    # render text: request.env['omniauth.auth'].to_yaml
    # user = User.from_omniauth(env["omniauth.auth"])
    # session[:user_id] = user.id
    # flash[:notice] = "Signed in!"
    # redirect_to root_url
  end
end
