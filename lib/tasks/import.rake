require 'csv'
namespace :import do
# https://gorails.com/episodes/intro-to-importing-from-csv
# http://samuelmullen.com/2015/05/fixing-postgres-sequences-in-rails/

  desc "Import posts from CSV"

  task persons: :environment do
    filename = File.join Rails.root, "Persons.csv"
    CSV.foreach(filename,  encoding: "ISO-8859-1", headers: true) do |row|
      Person.create!(id: row["person_id"], title: row["title"], first_name: row["first_name"], last_name: row["last_name"], gender: row["gender"])
    end
    ActiveRecord::Base.connection.execute("SELECT SETVAL('people_id_seq', COALESCE(MAX(id), 1) ) FROM people;")
  end


  task posts: :environment do
    filename = File.join Rails.root, "Posts.csv"
    CSV.foreach(filename,  encoding: "ISO-8859-1", headers: true) do |row|
      Post.create!(id: row["post_id"], organization_id: row["organization_id"], person_id: row["person_id"], organization_role_code: row["organization_role_code"], job_title: row["job_title"] , start_date: row["start_date"] , end_date: row["end_date"], data_source: row["data_source"])
    end
    ActiveRecord::Base.connection.execute("SELECT SETVAL('posts_id_seq', COALESCE(MAX(id), 1) ) FROM posts;")
  end

  task organizations: :environment do
    filename = File.join Rails.root, "Organizations.csv"
    CSV.foreach(filename,  encoding: "ISO-8859-1", headers: true) do |row|
      Organization.create!(id: row["organization_id"], name: row["name"])
    end
    ActiveRecord::Base.connection.execute("SELECT SETVAL('organizations_id_seq', COALESCE(MAX(id), 1) ) FROM organizations;")
  end

  task institution_details: :environment do
    filename = File.join Rails.root, "Institution_details.csv"
    CSV.foreach(filename,  encoding: "ISO-8859-1", headers: true) do |row|
      InstitutionDetail.create!(id: row["institution_detail_id"], organization_id: row["organization_id"], institution_type_id: row["institution_type_id"], local_authority_organization_id: row["local_authority_organization_id"], min_age: row["min_age"], max_age: row["max_age"], establishment_status: row["establishment_status"], institution_type: row["institution_type"], website: row["website"], uk_urn: row["uk_urn"])
    end
    ActiveRecord::Base.connection.execute("SELECT SETVAL('institution_details_id_seq', COALESCE(MAX(id), 1) ) FROM institution_details;")
  end

end
