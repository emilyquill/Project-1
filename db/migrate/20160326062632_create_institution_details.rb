class CreateInstitutionDetails < ActiveRecord::Migration
  def change
    create_table :institution_details do |t|
      t.integer :organization_id
      t.integer :institution_type_id
      t.integer :local_authority_organization_id
      t.integer :min_age
      t.integer :max_age
      t.text :establishment_status
      t.text :institution_type
      t.text :website
      t.integer :uk_urn
    end
  end
end
