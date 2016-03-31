class InstitutionDetailsController < ApplicationController

  def edit
    @institution_detail = InstitutionDetail.find_by(organization_id: params[:id])
  end

  def update
    institution_detail = InstitutionDetail.find_by(organization_id: params[:id])
    institution_detail.update institution_detail_params
    redirect_to organization_path(institution_detail.organization_id)
  end



  private
# Whitelist
def institution_detail_params
 params.require(:institution_detail).permit(:institution_type, :min_age, :max_age, :establishment_status)
 # require = ‘go inside of params and look at the institution_detail key'
end
end
