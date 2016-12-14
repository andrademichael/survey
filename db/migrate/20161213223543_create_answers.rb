class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table(:answers) do |t|
      t.column(:answer_text, :string)
      t.column(:question_id, :int)
    end
  end
end
