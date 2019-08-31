class CreateRiddlePosts < ActiveRecord::Migration
  def change
    create_table :riddle_posts do |t|
      t.string :title
      t.string :content
      t.integer :user_id 
      t.timestamps null: false 
    end
  end
end
#timestamps automatically gives times of creation 