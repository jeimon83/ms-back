class Api::V1::CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show update destroy ]

  # GET /customers
  def index
    # unless params[:name].nil?
    #   params[:name].downcase!
    #   params[:name].gsub!(/\w+/, &:capitalize)
    #   render json: Customer.where("name LIKE ?", "%#{params[:name]}%").first
    # else
     @customers = Customer.includes(:antennas).all
     render json: @customers, include: :antennas
    # end
  end

  # GET /customers/:id
  def show
    render json: @customer
  end

  # POST /customers
  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      render json: @customer, status: :created
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customers/1
  def update
    if @customer.update(customer_params)
      render json: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /customers/1
  def destroy
    if @customer.destroy
      render json: { message: 'Customer was successfully deleted.' }
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_customer
    @customer = Customer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def customer_params
    params.require(:customer).permit(:name, :cuit, :phone, :email, :address, :contact)
  end
end
