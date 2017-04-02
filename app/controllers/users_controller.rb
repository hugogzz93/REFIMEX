class UsersController < CrudController
	before_action :check_if_allowed

	def check_if_allowed
		permit_if_admin unless ["edit", "update"].include?(params[:action]) && params[:id].to_i == current_user.id
	end
end
