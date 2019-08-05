class CatRentalRequestsController < ApplicationController

    def index
        @kitty = CatRentalRequest.all
        render :index
    end
    def new
        @kitty = CatRentalRequest.new
        render :new
    end

    def show
        @kitty = CatRentalRequest.find(params[:id])
        render :show
    end

    def edit
        @kitty = CatRentalRequest.find(params[:id])
        render :edit
    end

    def approve
        @kitty = CatRentalRequest.find(params[:id])
        if @kitty.update(status: 'APPROVED')
            redirect_to cat_rental_requests_url
        else
            render :show
        end
    end

    def new
        @kitty = CatRentalRequest.new
        render :new
    end

    def update
        @kitty = CatRentalRequest.find(params[:id])
        if @kitty.update(cat_rental_request_params)
            redirect_to cat_rental_requests_url(@kitty)
        else
            render json: @kitty.errors.full_messages, status: 422
        end
    end

    def create
        @kitty = CatRentalRequest.new(cat_rental_request_params)
        if @kitty.save
            redirect_to cat_rental_requests_url(@kitty)
        else
            render json: @kitty.errors.full_messages, status: 422
        end
    end

    private

    def cat_rental_request_params
        params.require(:kitty).permit(:cat_id, :start_date, :end_date, :status)
    end

end