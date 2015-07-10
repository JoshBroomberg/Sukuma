module TipsHelper

	def catColour category
		case category
		when "Budgeting"
			"danger"
		when "Shortfalls"
			"primary"
		when "Debts"
			"success"
		when "Savings"
			"info"
		when "EssentialsVsExtras"
			"warning"
		when "S.M.A.R.T"
			"danger"
		end
	end
end