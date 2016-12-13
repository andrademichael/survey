require("spec_helper")

describe(Question) do
  it("ensures the question text is not blank") do
    test_question = Question.new({:question_text => "", :survey_id => 1})
    expect(test_question.save()).to(eq(false))
  end
end
