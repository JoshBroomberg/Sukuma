class Account < ActiveRecord::Base
  belongs_to :client

  validates :pin, length: { is: 4 }
end
