class Organization < ActiveRecord::Base
  has_one :institution_detail
  has_many :posts
  has_many :people, :through => :posts
end
