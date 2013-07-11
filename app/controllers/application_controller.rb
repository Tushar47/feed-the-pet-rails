class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_owner!

  def after_sign_in_path_for(resource)
    owner_path(resource)
  end

  def after_sign_out_path_for(resource)
    new_owner_session_path
  end
end
