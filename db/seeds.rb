require 'faker'

10.times do
  User.create(:name => Faker::Name.name,
              :email => Faker::Internet.email,
              :password => "12345",
              :password_confirmation => "12345")
end

20.times do
  s = Survey.create(:title => Faker::Company.bs,
                    :description => Faker::Company.catch_phrase,
                    :user_id => User.all.sample.id)
  5.times do
    q = Question.create(:question => Faker::Address.city,
                        :survey_id => s.id)
    3.times do
      Choice.create(:choice => Faker::Company.bs,
                    :question_id => q.id)
    end
  end

  u = User.all.sample

  3.times do |id|
    u_id = u.id + id

    s.questions.each do |question|
      Response.create(:user_id => u_id,
                      :choice_id => (question.id * 3 + (rand(3) + 1)))
    end
  end

end

