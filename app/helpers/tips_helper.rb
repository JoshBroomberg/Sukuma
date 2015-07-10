module TipsHelper

	def catColour category
		case category
		when "Budgeting"
			"success"
		when "Shortfalls"
			"danger"
		when "Debts"
			"danger"
		when "Savings"
			"success"
		when "EssentialsVsExtras"
			"info"
		when "S.M.A.R.T"
			"primary"
		end
	end
end