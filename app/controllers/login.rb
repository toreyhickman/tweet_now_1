post '/' do # Login path

  # Assumes login by username
  unless params[:username] == "" || params[:password] == ""
    @user = User.find_by_username(params[:username])
      if @user.password == params[:password]
        session[:user_id] = @user.id
        redirect "/"
      else
        @login_errors = login_errors
        erb :index
      end
  else
    @login_errors = login_errors
    erb :index
  end

end
