class Question < ActiveRecord::Base
  validates(:question_text, {:presence => true})
end
