class SampleController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: [:index]
    around_filter :hypernova_render_support

    def index        
    end
end