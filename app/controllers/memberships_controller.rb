class MembershipsController < ApplicationController
  def index
    @memberships = Membership.all
    # authorize @membership
  end

  def show
    @membership = Membership.find(params[:id])
    authorize @membership
  end
end
