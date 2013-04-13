
namespace '/sessions' do

before '/login' do
  redirect '/' if login?
end

  get '/login/?' do
    erb :"sessions/login"
  end

  post '/login/?' do
    user = authenticate(params)
    login(user)
  end

  delete '/logout/?' do
    session[:current_user_id] = nil
    session[:messages] = "Successfully logged out!"
    redirect '/'
  end
  
end
