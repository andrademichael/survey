class Answer < ActiveRecord::Base
  validates(:answer_text, {:presence => true})
end
