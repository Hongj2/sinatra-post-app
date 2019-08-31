class CreateRiddlePosts < ActiveRecord::Migration
  def change
    create_table :riddle_posts do |t|

      t.timestamps null: false
    end
  end
end
