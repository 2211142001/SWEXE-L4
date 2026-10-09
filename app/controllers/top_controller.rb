class TopController < ApplicationController
  def main
    if session[:login_uid].nil?
      render "login"
    else
      render "main"
    end
  end

  def login
    uid = params[:uid]
    pass = params[:pass]

    if uid == "kindai" && pass == "sanriko"
      session[:login_uid] = uid
      redirect_to main_path
    else
      render "error"
    end
  end
end
