class HomesController < ApplicationController

  def after_sign_in_path_for(resource)
     user_session_path
  end
  
  def about
  end
end
