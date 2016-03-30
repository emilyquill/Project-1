# == Schema Information
#
# Table name: institution_details
#
#  id                              :integer          not null, primary key
#  organization_id                 :integer
#  institution_type_id             :integer
#  local_authority_organization_id :integer
#  min_age                         :integer
#  max_age                         :integer
#  establishment_status            :text
#  institution_type                :text
#  website                         :text
#  uk_urn                          :integer
#

class InstitutionDetail < ActiveRecord::Base
  belongs_to :organization
end
