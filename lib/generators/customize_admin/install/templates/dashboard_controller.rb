class <%= @name_space_class%>::DashboardController < CustomizeAdmin::BaseController
  before_filter :authenticate_admin_user!
  def index
  end
end
