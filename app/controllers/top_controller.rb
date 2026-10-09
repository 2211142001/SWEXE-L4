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

    if User.exists?(uid: uid, pass: pass)
      session[:login_uid] = uid
      redirect_to main_path
    else
      flash[:error] = "IDまたはパスワードが間違っています"
      render "error"
    end
  end

  def register_form
    render "register"
  end

  def register
    user = User.new(uid: params[:uid], pass: params[:pass])
    if user.save
      session[:login_uid] = user.uid
      redirect_to main_path
    else
      flash[:error] = "登録に失敗しました"
      render "error"
    end
  end

  def logout
    session.delete(:login_uid)
    redirect_to main_path
  end
end
