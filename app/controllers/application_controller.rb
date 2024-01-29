class ApplicationController < ActionController::Base

    before_action :authenticate_user!
    layout :app_layout

    def app_layout
         devise_controller? ? "authentication": current_user.admin? ? "admin/application" : "application" 
    end

    def after_sign_in_path_for(resource)
      if resource.admin?
          admin_root_path
        else
          stored_location_for(resource) || root_path
        end
    end

    def is_admin?
      return if current_user.admin?

      flash[:warning] = t "receipt.not_permissions"
      redirect_to root_url
    end


end
