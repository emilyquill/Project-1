class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :organization_id
      t.integer :person_id
      t.text :organization_role_code
      t.text :job_title
      t.date :start_date
      t.date :end_date
      t.text :data_source
    end
  end
end
