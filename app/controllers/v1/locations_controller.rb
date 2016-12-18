module V1
  class LocationsController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: [:show]

    # TODO unsolved: Could not use index & not appear in routes result. why?)
    def show
      @locations = Location.all
      render 'show', formats: 'json', handlers: 'jbuilder'
    end

  end
end