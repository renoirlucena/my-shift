class MembershipsController < ApplicationController
  def index
    @memberships = policy_scope(Membership)
    # authorize @membership
  end

  def show
    @membership = Membership.find(params[:id])
    authorize @membership
  end
end
