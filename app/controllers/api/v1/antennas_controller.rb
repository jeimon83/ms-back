class Api::V1::AntennasController < ApplicationController
  before_action :set_antenna, only: %i[ show update destroy ]

  # GET /antennas
  def index
    @antennas = Antenna.all

    render json: @antennas
  end

  # GET /antennas/1
  def show
    render json: @antenna
  end

  # POST /antennas
  def create
    @antenna = Antenna.new(antenna_params)

    if @antenna.save
      render json: @antenna, status: :created, location: @antenna
    else
      render json: @antenna.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /antennas/1
  def update
    if @antenna.update(antenna_params)
      render json: @antenna
    else
      render json: @antenna.errors, status: :unprocessable_entity
    end
  end

  # DELETE /antennas/1
  def destroy
    @antenna.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_antenna
      @antenna = Antenna.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def antenna_params
      params.require(:antenna).permit(:cpa, :location)
    end
end
