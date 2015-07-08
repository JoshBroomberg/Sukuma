class Profile < ActiveRecord::Base
  belongs_to :client
  enum category: [:Food, :Alcohol, :Clothes, :Leisure, :Travel, :Medicine]
end
