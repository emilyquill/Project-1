require 'open-uri'

class Organization < ActiveRecord::Base
  has_one :institution_detail
  has_many :posts
  has_many :people, :through => :posts

  def get_edubase_ht(urn)
      doc = Nokogiri::HTML(open("http://www.education.gov.uk/edubase/establishment/summary.xhtml?urn=#{urn}"))
      ht = nil
      ht = doc.at_css(".first td:first-of-type").text unless doc.at_css(".first td:first-of-type") == nil
      return ht
    end

end
