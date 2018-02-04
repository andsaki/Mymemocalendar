class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :content
      t.string :year
      t.string :month
      t.string :date

      t.timestamps
    end
  end
end
