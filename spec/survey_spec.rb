require('spec_helper')

describe(Survey) do
  it('capitalizes the words of an entered title') do
    test_survey = Survey.create({:title => "test survey"})
    expect(test_survey.title()).to(eq("Test Survey"))
  end
  it('ensures the survey title is not blank') do
    test_survey = Survey.new({:title => ""})
    expect(test_survey.save()).to(eq(false))
  end
end
