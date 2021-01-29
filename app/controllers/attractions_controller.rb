class AttractionsController < ApplicationController
    before_action :set_attraction, only: [:show, :edit, :update]

    def new 
        @attraction = Attraction.new
    end 

    def create 
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def edit
        @ride = @attraction.rides.build(user_id: current_user.id)
    end 

    def update 
        if @attraction
            @attraction.update(attraction_params)
            redirect_to attraction_path(@attraction)
        else 
            redirect_to attractions_path 
        end 
    end 




    def index
        @attractions = Attraction.all
    end

    def show 
        @ride = @attraction.rides.build(user_id: current_user.id)
    end 

    private 

    def set_attraction 
        @attraction = Attraction.find_by(id: params[:id])
    end 

    def attraction_params 
        params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :min_height, :tickets)
    end 

end 