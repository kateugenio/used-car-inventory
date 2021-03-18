class Vehicle < ApplicationRecord
  # Constants
  CONDITIONS = ['New', 'Used'].freeze

  # Scopes
  default_scope { order(created_at: :desc) }

  # Validations
  validates :make, :model, :location, :condition, :initial_price, :year, :mileage, presence: true
  validates :initial_price, :year, :mileage, numericality: { greater_than_or_equal_to: 0 }
  validates :current_price, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
  validates :condition, inclusion: { in: CONDITIONS }

  # Instance Methods

  # Runs once a month via rake task. See vehicle:depreciate_price rake task in lib/tasks/.
  # Scheduled with whenever in config/schedule.rb
  def depreciate
    # 0.98 denotes car depreciation of 2% each month
    # If there is no current_price, then this was a newly added vehicle and the depreciation
    # has not begun yet
    adjusted_price = if current_price.nil?
                       initial_price * 0.98
                     else
                       current_price * 0.98
                     end

    update(current_price: adjusted_price)
  end
end
