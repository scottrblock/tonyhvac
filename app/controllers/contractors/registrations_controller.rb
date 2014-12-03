module Contractors

  class RegistrationsController < Devise::RegistrationsController

    def new
      build_resource({})
      respond_with self.resource
    end
   
    def create
      super
    end
   
    private
   
    def sign_up_params
      allow = [:email, :password, :password_confirmation]
      params.require(resource_name).permit(allow)
    end
   
  end

end