namespace :clean do
  desc "Clean up NULL strings imported from CSV"

  task persons: :environment do
    ActiveRecord::Base.connection.execute("UPDATE people SET gender= NULL WHERE gender ='NULL';")
    ActiveRecord::Base.connection.execute("UPDATE people SET last_name= NULL WHERE last_name ='NULL';")
    ActiveRecord::Base.connection.execute("UPDATE people SET first_name= NULL WHERE first_name ='NULL';")
    ActiveRecord::Base.connection.execute("UPDATE people SET title= NULL WHERE title ='NULL';")
  end

  task posts: :environment do
    ActiveRecord::Base.connection.execute("UPDATE posts SET organization_role_code= NULL WHERE organization_role_code ='NULL';")
    ActiveRecord::Base.connection.execute("UPDATE posts SET job_title= NULL WHERE job_title ='NULL';")
    ActiveRecord::Base.connection.execute("UPDATE posts SET data_source= NULL WHERE data_source='NULL';")
  end

  task organizations: :environment do
    ActiveRecord::Base.connection.execute("UPDATE organizations SET name= NULL WHERE name='NULL';")
  end

  task institution_details: :environment do
    ActiveRecord::Base.connection.execute("UPDATE institution_details SET establishment_status= NULL WHERE establishment_status='NULL';")
    ActiveRecord::Base.connection.execute("UPDATE institution_details SET institution_type= NULL WHERE institution_type='NULL';")
    ActiveRecord::Base.connection.execute("UPDATE institution_details SET website= NULL WHERE website='NULL';")
  end

end
