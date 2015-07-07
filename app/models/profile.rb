class Profile < ActiveRecord::Base
  belongs_to :client

  enum category: [:food, :alcohol, :clothes, :leisure]
end
