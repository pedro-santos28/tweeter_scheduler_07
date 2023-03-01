class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.timestamp :published_at

      t.timestamps
    end
  end
end
