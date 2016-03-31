
class PeopleController < ApplicationController

  def new
    @organization = Organization.find params[:organization_id]
  end

  def create
    person = Person.new
    post = Post.new
    person.title = params[:title]
    person.first_name = params[:first_name]
    person.last_name = params[:last_name]
    person.gender = params[:gender]
    post.organization_id = params[:organization_id]
    post.organization_role_code = params[:organization_role_code]
    post.job_title = params[:job_title]
    post.start_date = params[:start_date]
    post.end_date = params[:end_date]
    person.save
    post.person_id = person.id
    post.save
    redirect_to organization_path(params[:organization_id])
    @back = flash[:previous_url]

  end

end
