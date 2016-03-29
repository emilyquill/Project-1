require 'open-uri'

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
  end

  def headteacher
    @organization =  Organization.find params[:id]
    render :json => {
      :name => @organization.get_edubase_ht(@organization.institution_detail.uk_urn)
    }
  end

end
