# == Schema Information
#
# Table name: posts
#
#  id                     :integer          not null, primary key
#  organization_id        :integer
#  person_id              :integer
#  organization_role_code :text
#  job_title              :text
#  start_date             :date
#  end_date               :date
#  data_source            :text
#

class Post < ActiveRecord::Base
  belongs_to :person
  belongs_to :organization
end
