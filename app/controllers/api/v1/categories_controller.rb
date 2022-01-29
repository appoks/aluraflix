module Api
    module V1
      class CategoriesController < ApiController
  
        before_action :set_category, only: %i[ show edit update destroy ]
  
        def index
          render json: @categories = Category.all
        end
  
        def show
          render json: @category, :except => [:created_at, :updated_at],
                                  :include => { :videos => { :except => [:created_at, :updated_at] } }
        end
  
        def create
          @category = Category.new(category_params)
          if @category.save
            render json: @category
          else
            render json: @category.errors, status: :unprocessable_entity
          end
        end
  
        def update
          if @category.update(category_params)
            render json: @category, status: :ok
          else
            render json: @category.errors, status: :unprocessable_entity
          end
        end
  
        def destroy
          @category.destroy
          render json: @category
        end
  
        private
        
        # Use callbacks to share common setup or constraints between actions.
        def set_category
          @category = Category.find(params[:id])
        end
  
        # Only allow a list of trusted parameters through.
        def category_params
          params.require(:category).permit(:title, :color)
        end
  
      end
    end
  end
  