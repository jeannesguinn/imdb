class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :name
      t.date :year_of_birth
      t.string :thumbnail

      t.timestamps null: false
    end
  end
end
