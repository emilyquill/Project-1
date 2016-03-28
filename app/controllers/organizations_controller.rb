class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.includes(:posts, :people).limit(40)
  end

  def list
    result_length = 10
    @page = params[:page].to_i
    offset = (@page-1)*result_length
    @organizations = Organization.includes(:posts, :people, :institution_detail).limit(10).offset(offset)
  end


  def show
    @organization =  Organization.includes(:posts, :institution_detail).find params[:id]
    require 'open-uri'
    doc = Nokogiri::HTML(open("http://www.education.gov.uk/edubase/establishment/summary.xhtml?urn=#{@organization.institution_detail.uk_urn}"))
    @edu_ht = nil
    @edu_ht = doc.at_css(".first td:first-of-type").text unless doc.at_css(".first td:first-of-type") == nil
  end
end
