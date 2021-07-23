module Api
  module V1
    class VideosController < ApiController

      before_action :set_video, only: %i[ show edit update destroy ]

      def index
        render json: @videos = Video.all
      end

      def new
        @video = Video.new
      end

      def create
        @video = Video.new(video_params)

        if @video.save
          render json: @video
        else
          render json: @video.errors, status: :unprocessable_entity
        end
      end

      def update
        if @video.update(video_params)
          render json: @video, status: :ok
        else
          render json: @video.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if @video.destroy
          render json: @video
        else
          render json: @video.errors, status: :bad_request
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_video
        @video = Video.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def video_params
        params.require(:video).permit(:title, :description, :url, :thumb)
      end

    end
  end
end
