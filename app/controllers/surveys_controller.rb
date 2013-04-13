namespace '/surveys' do
  
  before '/new' do
    authenticate!
  end

  get '/new' do
    erb :"surveys/new"
  end

  post '/' do
    @survey = current_user.surveys.build(params[:survey])
    if @survey.save
      session[:messages] = "Survey created!"
      redirect "/surveys/#{@survey.id}"
    else
      @errors = "Failed to create survey"
      erb :"surveys/new"
    end
  end

  get '/:id' do
    @survey = Survey.find_by_id(params[:id])
    if @survey
      erb :"surveys/show"
    else
      session[:errors] = "Survey not found"
      redirect '/'
    end
  end

  put '/' do
    @survey = Survey.find_by_id(params[:survey_id])
    if @survey
      @survey.update_attributes(params[:survey])
      redirect "/surveys/#{@survey.id}"
    else
      @errors = "Failed to update survey"
      erb :"surveys/show"
    end
  end

  delete '/' do
    survey = Survey.find_by_id(params[:survey_id])
    if survey
      survey.delete
      session[:messages] = "Survey deleted!"
    end
    redirect "/users/#{current_user.id}"
  end
end
