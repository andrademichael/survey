class Answer < ActiveRecord::Base
  validates(:answer_text, {:presence => true})
  belongs_to(:question)
end
