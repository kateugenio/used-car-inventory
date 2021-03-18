class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def new
    @vehicle = Vehicle.new
    # Cancancan method
    # Don't let the clever user in
    authorize! :create, @vehicle
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    authorize! :create, @vehicle

    if @vehicle.save
      flash[:success] = "Successfully added #{@vehicle.make} #{@vehicle.model} to inventory."
      redirect_to vehicles_path
    else
      flash[:error] = "There was an problem with your submission, please review the errors below."
      render :new
    end
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    authorize! :destroy, @vehicle
    @vehicle.destroy

    flash[:success] = "Successfully deleted #{@vehicle.make} #{@vehicle.model} from inventory."
    redirect_to vehicles_path
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(
      :make,
      :model,
      :location,
      :condition,
      :initial_price,
      :year,
      :mileage
    )
  end
end
