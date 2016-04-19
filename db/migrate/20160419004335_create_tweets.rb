class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :status
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :tweets, :user_id
  end
end