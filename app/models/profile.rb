class Profile < ActiveRecord::Base
  belongs_to :client
  enum category: [:Food, :Transport, :Clothing, :Housing, :Medical, :Recreation, :Other]
end
