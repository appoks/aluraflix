module Api
    module V1
      class VideosController < ApiController
        def index
          render json: @videos = Video.all
        end
      end
    end
  end