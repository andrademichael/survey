require('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a new survey', {:type => :feature}) do
  it('allows user to enter title of a new survey') do
    visit('/')
    fill_in('new_survey_input', :with => "awesome survey")
    click_on('Create!')
    expect(page).to have_content('Awesome Survey')
  end
end

describe('create a new question', {:type => :feature}) do
  it('allows user to enter the text of a new question') do
    visit('/')
    fill_in('new_survey_input', :with => "awesome survey")
    click_on('Create!')
    click_link('Awesome Survey')
    fill_in('new_question_input', :with => "Testing")
    click_on('Create!')
    expect(page).to have_content("Testing")
  end
end

describe('update a survey', {:type => :feature}) do
  it('allows user to change the title of the survey') do
    visit('/')
    fill_in('new_survey_input', :with => "awesome survey")
    click_on('Create!')
    click_link("Awesome Survey")
    fill_in('survey_title_change', :with => "crappy survey")
    click_on('Update!')
    expect(page).to have_content("Crappy Survey")
  end
end

describe('delete a survey', {:type => :feature}) do
  it('allows a user to delete the survey after warning') do
    visit('/')
    fill_in('new_survey_input', :with => "awesome survey")
    click_on('Create!')
    click_link("Awesome Survey")
    click_on('Delete this survey?!')
    click_on('Delete!')
    expect(page).to have_content("Silly Surveys")
  end
end

describe('update a question', {:type => :feature}) do
  it('allows a user to update the questions from the survey page') do
    visit('/')
    fill_in('new_survey_input', :with => "awesome survey")
    click_on('Create!')
    click_on("Awesome Survey")
    fill_in('new_question_input', :with => "Testing")
    click_on('Create!')
    click_on('Testing')
    fill_in('change_question_text', :with => "Updating")
    click_on('Update!')
    expect(page).to have_content("Updating")
  end
end

describe('delete a question', {:type => :feature}) do
  it('allows a user to delete the questions') do
    visit('/')
    fill_in('new_survey_input', :with => "awesome survey")
    click_on('Create!')
    click_on("Awesome Survey")
    fill_in('new_question_input', :with => "Testing")
    click_on('Create!')
    click_on('Testing')
    click_on('Delete this question?!')
    click_on('Delete!')
    expect(page).to have_content('Title: Awesome Survey')
  end
end
