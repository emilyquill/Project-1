class CreatePersons < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.text :title
      t.text :first_name
      t.text :last_name
      t.text :gender
    end
  end
end
