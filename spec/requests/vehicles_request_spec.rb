require 'rails_helper'

RSpec.describe "Vehicles", type: :request do
  before {
    @admin = create(:admin)
    sign_in @admin
  }

  it 'renders index' do
    # Act
    get vehicles_path

    # Assert
    expect(response).to render_template(:index)
  end

  it 'renders new' do
    # Act
    get new_vehicle_path

    # Assert
    expect(response).to render_template(:new)
  end

  it 'renders show' do
    # Arrange
    vehicle = create(:vehicle)

    # Act
    get vehicle_path(vehicle)

    # Assert
    expect(response).to render_template(:show)
  end

  describe '#create' do
    it 'creates successfully' do
      # Arrange
      params = {
        vehicle: {
          make: 'Toyota',
          model: 'Rav4',
          location: 'San Francisco',
          year: '2016',
          mileage: 75343,
          condition: 'Used',
          initial_price: 16899
        }
      }
      vehicles_before = Vehicle.count

      # Act
      post vehicles_path(params)

      # Assert
      expect(response).to redirect_to(vehicles_path)
      expect(Vehicle.count).to eq vehicles_before + 1
    end

    it 'renders flash error if unsuccessful' do
      # Arrange
      params = {
        vehicle: {
          make: '',
          model: 'Rav4',
          location: 'San Francisco',
          year: '2016',
          mileage: 75343,
          condition: '',
          initial_price: 16899
        }
      }
      vehicles_before = Vehicle.count

      # Act
      post vehicles_path(params)

      # Assert
      expect(response).to render_template(:new)
      expect(Vehicle.count).to eq vehicles_before
      expect(flash[:error]).to include 'There was an problem with your submission, please review the errors below.'
    end
  end

  it 'destroys successfully' do
    # Arrange
    vehicle = create(:vehicle)

    # Act
    delete vehicle_path(vehicle)

    # Assert
    expect(response).to redirect_to(vehicles_path)
  end
end
