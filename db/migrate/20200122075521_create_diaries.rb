class CreateDiaries < ActiveRecord::Migration[5.0]
  def change
    create_table :diaries do |t|
      t.text :text
      t.integer :point
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
