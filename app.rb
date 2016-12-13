require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('./lib/survey.rb')
require('./lib/question.rb')
require('pg')
require('pry')

get('/') do
  @surveys = Survey.all()
  erb(:index)
end

post('/create_survey') do
  new_survey_title = params.fetch("new_survey_input")
  new_survey = Survey.create({:title => new_survey_title})
  new_survey.save()
  @surveys = Survey.all()
  erb(:index)
end

get('/survey/:id') do
  @survey = Survey.find(params.fetch("id").to_i())
  @questions = Question.where(survey_id: @survey.id())
  erb(:survey)
end

post('/create_question') do
  new_question_text = params.fetch("new_question_input")
  survey_id = params.fetch("current_survey_id")
  @survey = Survey.find(survey_id.to_i())
  @new_question = Question.create({:question_text => new_question_text, :survey_id => survey_id})
  if @new_question.save()
    @questions = Question.all()
    redirect to("/survey/#{@survey.id}")
  else
    @questions = Question.all()
    erb(:survey)
  end
end

patch('/change_survey_title') do
  rename_title = params.fetch("survey_title_change")
  survey_id = params.fetch("current_survey_id")
  @survey = Survey.find(survey_id.to_i())
  if @survey.update({:title => rename_title})
    @questions = Question.all()
    redirect to ("/survey/#{@survey.id}")
  else
    @questions = Question.all()
    erb(:survey)
  end
end

post('/delete_survey_warning') do
  survey_id = params.fetch("current_survey_id")
  @survey = Survey.find(survey_id.to_i())
  erb(:delete_survey_warning)
end

delete('/delete_survey') do
  survey_id = params.fetch("current_survey_id")
  @survey = Survey.find(survey_id.to_i())
  @survey.destroy()
  @surveys = Survey.all()
  redirect to ('/')
end

get('/question/:id') do
  question_id = params.fetch("id")
  @question = Question.find(question_id.to_i())
  erb(:question)
end

patch('/update_question') do
  rename_text = params.fetch("change_question_text")
  question_id = params.fetch("current_question_id")
  @question = Question.find(question_id.to_i())
  @question.update({:question_text => rename_text})
  redirect to ("/question/#{@question.id}")
end

post('/delete_question_warning') do
  question_id = params.fetch("current_question_id")
  @question = Question.find(question_id.to_i())
  erb(:delete_question_warning)
end

delete('/delete_question') do
  question_id = params.fetch("current_question_id")
  @question = Question.find(question_id.to_i())
  survey_id = @question.survey_id()
  @question.destroy()
  @questions = Question.all()
  redirect to ("/survey/#{survey_id}")
end
