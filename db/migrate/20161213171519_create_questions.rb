class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table(:questions) do |t|
      t.column(:question_text, :string)
      t.column(:question_answer, :string)
      t.column(:survey_id, :int)
    end
  end
end
