class Question < ActiveRecord::Base
  validates(:question_text, {:presence => true})
  belongs_to(:survey)
  has_many(:answers)
end
