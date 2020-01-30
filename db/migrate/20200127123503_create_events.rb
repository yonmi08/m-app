class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.text :fail_text
      t.string :fail_url
      t.text :pass_text
      t.string :pass_url
      t.references :group, foreign_key: true
      t.timestamps
    end
  end
end
