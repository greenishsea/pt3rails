module V1
  class CustomersController < ApplicationController
    # skip_before_action :authenticate_user_from_token!, only: [:create]

    def show
        render json: Customer.all
    end

  end
end