namespace '/users' do

  get '/new/?' do
    erb :"users/new"
  end

  post '/?' do
    @user = User.new(params[:user])

    if @user.save
      #remember to login user here #work on this when working on session
      redirect "/users/#{@user.id}"
    else
      session[:errors] = "We love you but we failed to create an account for you. Please try again!"
      redirect '/'
    end
  end

  get '/:id/?' do
    user_id = params[:id]

    @user = User.find_by_id(user_id)
    if @user
      erb :"users/show"
    else
      session[:errors] = "Couldn't find user with ID #{user_id}"
      redirect '/'
    end
  end

  get '/:id/edit/?' do
    user_id = params[:id]

    @user = User.find_by_id(user_id)
    if @user
      erb :"users/edit"
    else
      session[:errors] = "No such user!"
      redirect '/'
    end
  end

  put '/?' do
    user_id = params[:user_id]

    @user = User.find_by_id(user_id)
    if @user
      @user.update_attributes(params[:user])
      redirect "/users/#{user_id}"
    else
      session[:errors] = "Unauthorized yo!"
      redirect '/'
    end
  end

  delete '/:id/?' do
    User.delete(params[:id])
    session[:messages] = "User deleted"
    redirect '/'
  end
end
