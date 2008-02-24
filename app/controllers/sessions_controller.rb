class SessionsController < ApplicationController
  def destroy
    session[:admin] = nil
    redirect_to '/'
  end
end
