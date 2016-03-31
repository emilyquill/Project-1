require 'open-uri'

class OrganizationsController < ApplicationController

  def index
    redirect_to "/organizations/list/1"
  end

  def list
    result_length = 10
    @page = params[:page].to_i
    offset = (@page-1)*result_length
    @organizations = Organization.includes(:posts, :people, :institution_detail).limit(10).offset(offset)
  end

  def show
    @organization =  Organization.includes(:posts, :institution_detail).find params[:id]
    @back = flash[:previous_url]
  end

  def edit
    @organization = Organization.find params[:id]
  end

  def update
    organization = Organization.find params[:id]
    organization.update organization_params
    redirect_to organization
  end

  def headteacher
    @organization =  Organization.find params[:id]
      render :json => {
        :name => @organization.get_edubase_ht(@organization.institution_detail.uk_urn)
      }
  end


end
