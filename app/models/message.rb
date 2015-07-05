class Message < ActiveRecord::Base
	belongs_to :messagable, polymorphic: true
end
