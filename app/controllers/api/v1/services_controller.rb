class Api::V1::ServicesController < ApplicationController
  before_action :set_service, only: %i[show update destroy]

  # GET /services
  def index
    if params[:bandwith].nil?
      render json: Service.all
    else
      # {}params[:bandwith].downcase!
      # {}params[:bandwith].gsub!(/\w+/, &:capitalize)
      render json: Service.where('bandwith LIKE ?', "%#{params[:bandwith]}%")
    end
  end

  # GET /services/1
  def show
    render json: @service
  end

  # POST /services
  def create
    @service = Service.new(service_params)

    if @service.save
      render json: @service, status: :created
    else
      render json: @service.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /services/1
  def update
    if @service.update(service_params)
      render json: @service
    else
      render json: @service.errors, status: :unprocessable_entity
    end
  end

  # DELETE /services/1
  def destroy
    if @service.destroy
      render json: { message: 'Service was successfully deleted.' }
    else
      render json: @service.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_service
    @service = Service.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def service_params
    params.require(:service).permit(:technology, :bandwidth)
  end
end
