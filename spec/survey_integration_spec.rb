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
