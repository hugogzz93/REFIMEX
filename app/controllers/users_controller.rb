class UsersController < CrudController
	before_action :check_if_allowed

	def check_if_allowed
		permit_if_admin unless ["edit", "update"].include?(params[:action]) && params[:id].to_i == current_user.id
	end

		def object_params
			super.merge params.require(:user)
												.permit(:password, :password_confirmation)
	
		end

end
