class SiteFilesController < CrudController
	before_action :permit_if_admin, only: [:edit, :delete, :new, :create]

	def object_params
		super.merge params.require(:site_file)
											.permit(:certification)
	
	end
end
