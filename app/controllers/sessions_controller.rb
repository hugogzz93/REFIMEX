class SessionsController < ApplicationController
  def log_out
    Devise.sign_out_all_scopes ? sign_out : sign_out(current_user)
    redirect_to root_path
  end
end
