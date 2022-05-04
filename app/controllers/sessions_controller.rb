# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  include FlashHelper

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:return_to] || root_path
    else
      add_flash_now_message(:alert, 'Are you a Guru? Verify your email and password, please')
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end
end
