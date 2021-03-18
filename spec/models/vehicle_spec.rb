require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe '#validations' do
    it { is_expected.to validate_presence_of(:make) }
    it { is_expected.to validate_presence_of(:model) }
    it { is_expected.to validate_presence_of(:location) }
    it { is_expected.to validate_presence_of(:condition) }
    it { is_expected.to validate_presence_of(:initial_price) }
    it { is_expected.to validate_presence_of(:year) }
    it { is_expected.to validate_presence_of(:mileage) }

    it { is_expected.to validate_numericality_of(:initial_price) }
    it { is_expected.to validate_numericality_of(:year) }
    it { is_expected.to validate_numericality_of(:mileage) }

    it { is_expected.to validate_inclusion_of(:condition).in_array(Vehicle::CONDITIONS) }
  end

  describe '#depreciate' do
    it 'adjusts initial_price by 2 percent and sets as current_price if current_price is nil' do
      # Arrange
      vehicle = create(:vehicle)
      vehicle.update(initial_price: 5500)
      expected_adjusted_current_price = 5390 # 2% depreciation

      # Act
      vehicle.depreciate

      # Assert
      expect(vehicle.reload.current_price).to eq expected_adjusted_current_price
    end

    it 'adjusts present current_price by 2 percent' do
      # Arrange
      vehicle = create(:vehicle)
      vehicle.update(initial_price: 5500)
      vehicle.update(current_price: 5390)
      expected_adjusted_current_price = 5282.2 # 2% depreciation

      # Act
      vehicle.depreciate

      # Assert
      expect(vehicle.reload.current_price).to eq expected_adjusted_current_price
    end
  end
end
