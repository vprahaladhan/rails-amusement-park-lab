class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(id: params[:id].to_i)
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction.id)
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id].to_s)
  end

  def update
    @attraction = Attraction.find_by(id: params[:id].to_s)
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction.id)
  end

  def destroy
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :height, :tickets, :happiness_rating, :nausea_rating)
  end
end
