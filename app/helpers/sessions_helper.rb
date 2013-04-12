helpers do

  #use this method to protect private pages in before filters
  def authenticate!
    unless login?
      store_url_for_redirection
      session[:errors] = "Please login first"
      redirect '/' #should I redirect to login page?
    end
  end

  #move this method to the model?
  #check user exist and ensure the right password entered
  def authenticate(params)
    user = User.find_by_email(params[:email]) #find user exist in db
    user if user && user.password == params[:password] #authenticate pwd
  end

  def login(user)
    if user
      session[:messages] = "Successfully logged in!"
      session[:current_user_id] = user.id
      redirect_to_the_right_url
    else
      session[:errors] = "Failed to login"
      redirect '/'
    end
  end

  def store_url_for_redirection
    session[:redirect_url] = request.path
  end

  def redirect_to_the_right_url
    url = session[:redirect_url]
    if url
      session[:session_url] = nil
      redirect url
    else
      redirect '/'
    end
  end

  def current_user
    @current_user ||= User.find_by_id(session[:current_user_id])
    #I'm assigning to instance variable with the || because if I use this method in more than one place in the same request, it doesn't make a new database call everytime I use this method
  end

  def login?
    current_user ? true : false
  end
end
