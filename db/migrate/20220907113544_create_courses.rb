class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :image_url
      t.string :name
      t.belongs_to :author
      t.belongs_to :topic
      t.string :link
    end
  end
end
