namespace '/surveys' do
  
  
  before '/new' do
    authenticate!
  end

  get '/new' do
    erb :"surveys/new"
  end

  post '/?' do
    @survey = User.first.surveys.build(:title => params[:survey_title],
                                       :description => params[:survey_description])
    params[:questions].each_with_index do |q, i|
      q = @survey.questions.build(:question => q["question"])
      params[:questions][i]["choices"].each do |c|
        q.choices.build(:choice => c)
      end
    end
    if @survey.save
      session[:messages] = "Survey created!"
      redirect "/surveys/#{@survey.id}"
    else
      @errors = "Failed to create survey"
      erb :"surveys/new"
    end
  end

  get '/:id/?' do
    @survey = Survey.find(params[:id])
    @questions = Question.where(survey_id: @survey.id)
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

  post '/:id/?' do
    @choice_ids = params[:choice_id]

    @choice_ids.each do |choice_id|
      Response.create(user_id: session[:current_user_id], choice_id: choice_id)
    end

    redirect '/' 
  end
end
