class RemoveQuestionFromComments < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :question_id
  end
end
