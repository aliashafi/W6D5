class CatsController < ApplicationController
    def index
        @kitties = Cat.all
        render :index
    end

    def show
        @kitty = Cat.find(params[:id])
        render :show
    end

    def edit
        @kitty = Cat.find(params[:id])
        render :edit
    end

    def new
        @kitty = Cat.new
        render :new
    end

    def update
        @kitty = Cat.find(params[:id])
        if @kitty.update(cat_params)
            redirect_to cat_url(@kitty)
        else
            render json: @kitty.errors.full_messages, status: 422
        end
    end

    def create
        @kitty = Cat.new(cat_params)
        if @kitty.save
            redirect_to cat_url(@kitty)
        else
            render json: @kitty.errors.full_messages, status: 422
        end
    end

    private

    def cat_params
        params.require(:kitty).permit(:name, :birth_date, :color, :description, :sex)
    end
end