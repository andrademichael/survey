ENV['RACK_ENV'] = 'test'

require("rspec")
require("sinatra/activerecord")
require("pry")
require("pg")
require("./lib/survey")
require("./lib/question")

RSpec.configure do |config|
  config.after(:each) do
    Survey.all().each() do |survey|
      survey.destroy()
    end
    Question.all().each() do |question|
      question.destroy()
    end
  end
end
