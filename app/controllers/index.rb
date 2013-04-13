#if there it's a redirection, save error message in session. else pass message
#by assigning it to @errors
before do
  @errors = session[:errors]
  session[:errors] = nil if @errors
  @messages = session[:messages]
  session[:messages] = nil if @errors
end

#get all the surveys
before do
  @all_surveys = Survey.all
end

get '/' do
 
  # Look in app/views/index.erb
  erb :index
end
