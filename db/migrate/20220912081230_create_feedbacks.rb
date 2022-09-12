class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.string :rating
      t.string :reason
      t.belongs_to :course
    end
  end
end
