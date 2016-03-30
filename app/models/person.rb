# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  title      :text
#  first_name :text
#  last_name  :text
#  gender     :text
#

class Person < ActiveRecord::Base
  has_many :posts
end
