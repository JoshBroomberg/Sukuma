# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Message.delete_all
Transaction.delete_all
Profile.delete_all
Account.delete_all
Client.delete_all

Tip.delete_all
TipCategory.delete_all

    #client = Client.new(email: "user@user.com", password: "password", number: "+12316468691")
    #client2 = Client.new(email: "user2@user2.com", password: "password", number: "+12316468691")

    customer = Client.new(password: "password", number: "+27836538932")
    customer.save
    acc2 = customer.create_account(balance: 340.0, account_id: "cus1", pin: 1234)
    prof1 = Cprofile.new(client: customer,firstname: "Josh", lastname: "Broomberg", age: 18)
    prof1.save

    customer2 = Client.new(password: "password", number: "+27836538933")
    customer2.save
    acc3 = customer2.build_account(balance: 2000.0, account_id: "cus2", pin: 1234).save
    prof3 = Cprofile.new(client: customer2,firstname: "Josh2", lastname: "Broomberg2", age: 18)
    prof3.save

    customer4 = Client.new(password: "password", number: "+27836538934")
    customer4.save
    acc4 = customer4.create_account(balance: 2000.0, account_id: "cus3", pin: 1234)
    prof4 = Cprofile.new(client: customer4,firstname: "Josh3", lastname: "Broomberg3", age: 18)
    prof4.save


    business = Client.create!(password: "password", number: "+15712787457")
    acc1 = business.build_account(balance: 0.0, account_id: "aaaa", pin: 1234).save
    prof2 = Vprofile.create!(client: business, businessname: "TestBusiness inc.", category: 1)

    business2 = Client.create!(password: "password", number: "+15712787458")
    acc1 = business2.build_account(balance: 0.0, account_id: "aaab", pin: 1234).save
    prof2 = Vprofile.create!(client: business2, businessname: "TestBusiness2 inc.", category: 2)

    business3 = Client.create!(password: "password", number: "+15712787459")
    acc1 = business3.build_account(balance: 0.0, account_id: "aaac", pin: 1234).save
    prof2 = Vprofile.create!(client: business3, businessname: "TestBusiness3 inc.", category: 3)

    business4 = Client.create!(password: "password", number: "+15712787451")
    acc1 = business4.build_account(balance: 0.0, account_id: "aaad", pin: 1234).save
    prof2 = Vprofile.create!(client: business4, businessname: "TestBusiness4 inc.", category: 4)

    business5 = Client.create!(password: "password", number: "+15712787452")
    acc1 = business5.build_account(balance: 0.0, account_id: "aaae", pin: 1234).save
    prof2 = Vprofile.create!(client: business5, businessname: "TestBusiness5 inc.", category: 5)

    business6 = Client.create!(password: "password", number: "+15712787762")
    acc1 = business6.build_account(balance: 0.0, account_id: "aaae", pin: 1234).save
    prof2 = Vprofile.create!(client: business6, businessname: "TestBusiness6 inc.", category: 6)

    # business7 = Client.create!(password: "password", number: "+15718287452")
    # acc1 = business7.build_account(balance: 0.0, account_id: "aaae", pin: 1234).save
    # prof2 = Vprofile.create!(client: business7, businessname: "TestBusiness7 inc.", category: 7)





    Transaction.create!(customer_id: customer.id, vendor_id: business.id, amount: 50, state: :success, kind: :purchase)
    Transaction.create!(customer_id: customer.id, vendor_id: business.id, amount: 40, state: :success, kind: :deposit)
	Transaction.create!(customer_id: customer.id, vendor_id: business2.id, amount: 120, state: :success, kind: :purchase)
	Transaction.create!(customer_id: customer.id, vendor_id: business3.id, amount: 30, state: :success, kind: :purchase)
    Transaction.create!(customer_id: customer.id, vendor_id: business5.id, amount: 20, state: :success, kind: :deposit)
	Transaction.create!(customer_id: customer.id, vendor_id: business4.id, amount: 40, state: :success, kind: :purchase)
    Transaction.create!(customer_id: customer.id, vendor_id: business2.id, amount: 90, state: :success, kind: :deposit)
    Transaction.create!(customer_id: customer.id, vendor_id: business4.id, amount: 120, state: :success, kind: :deposit)
	Transaction.create!(customer_id: customer.id, vendor_id: business5.id, amount: 60, state: :success, kind: :purchase)
    Transaction.create!(customer_id: customer.id, vendor_id: business3.id, amount: 15, state: :success, kind: :deposit)
	Transaction.create!(customer_id: customer.id, vendor_id: business.id, amount: 70, state: :success, kind: :purchase)
	Transaction.create!(customer_id: customer.id, vendor_id: business2.id, amount: 190, state: :success, kind: :purchase)
    Transaction.create!(customer_id: customer.id, vendor_id: business6.id, amount: 120, state: :success, kind: :deposit)
    Transaction.create!(customer_id: customer.id, vendor_id: business3.id, amount: 60, state: :success, kind: :purchase)
    Transaction.create!(customer_id: customer.id, vendor_id: business6.id, amount: 15, state: :success, kind: :deposit)
    Transaction.create!(customer_id: customer.id, vendor_id: business.id, amount: 70, state: :success, kind: :purchase)
    Transaction.create!(customer_id: customer.id, vendor_id: business5.id, amount: 190, state: :success, kind: :purchase)


    budgeting = TipCategory.create!(name: "Budgeting", description: "It is important to make budgets for each time period between getting paid. This will keep you from incurring debt!" )
    shortfalls =TipCategory.create!(name: "Shortfalls", description: "Shortfalls occur when your expenses are more than what you will earn each month." )
    debts =TipCategory.create!(name: "Debts", description: "Debts are important to pay off because the longer you wait, the more interest you owe." )
    savings =TipCategory.create!(name: "Savings", description: "Saving money for emergencies is very important. This will help you avoid borrowing money and incurring more debt." )
    essentialsVsExtras =TipCategory.create!(name: "EssentialsVsExtras", description: "What is necessary to spend money on?" )
    smart =TipCategory.create!(name: "S.M.A.R.T", description: "Specific, measurable, attainable, relevant, time." )

    budgeting.tips.build(summary: "Organize", body: " Categorize your expenses! What is essential (food, electricity, etc) and what is extra (new clothes, renovations to your home, etc.).").save
    budgeting.tips.build(summary: "Extra expenses",body: " Look at your extra expenses (new clothes, renovations to your home, etc) and find the ones that you can cut back on this month.").save
    budgeting.tips.build(summary: "Receipts",body: " Keep your receipts (slips) in a safe place! It helps to organize them by category (food, electricity, extras, etc). This will help you keep track of how much you are spending per month and adjust your budget accordingly.").save
    budgeting.tips.build(summary: "Do the math",body: " Subtract what you spend on essentials from the amount you make each month. This is more difficult if your monthly income varies. If that is the case, estimate lower- better to be safe than sorry!").save

    shortfalls.tips.build(summary: "Don't cut out essentials",body: " NEVER cut any of your essential expenses from your budget completely. Insurance, savings, etc are very important and the decision to eliminate those will hurt you in the long run.").save
    shortfalls.tips.build(summary: "Essential spending",body: " Take a look at your essential spending. Can you buy food somewhere cheaper or share with a friend? Are you buying more airtime than you need each month? Can you walk to work or get a ride with a friend rather than paying for a bus?").save
    shortfalls.tips.build(summary: "Working",body: " Take a look at your employment. Can you work overtime, pick up a part time job, or even switch to a new position?").save
    shortfalls.tips.build(summary: "Organize",body: " If you are continually experiencing financial shortfalls, start writing down everything you spend money on. Organize this list by category (essential or extra) and include the date, description of purchase, and method of payment (cash, card?) for each entry.").save

    debts.tips.build(summary: "Organize",body: " Make a list of what you owe, who you owe, the interest rate and fees, and how long you have to pay off the loan.").save
    debts.tips.build(summary: "Which debt?",body: " Quickly pay off debts with the highest interest. As you pay off the highest costs, you’ll have more money to tackle the lesser debts.").save
    debts.tips.build(summary: "Minimum payments",body: " If you have credit card debt, don’t just pay the minimum monthly payment. Before you know it, the amount you owe will double because of interest. Make an effort to pay even R200 more than the minimum each month.").save
    debts.tips.build(summary: "When to pay",body: " Pay off debt before spending in the “extra” section of your budget. You need to pay off your debt before you buy new clothes or a car.").save
    debts.tips.build(summary: "Be patient!",body: " Reducing debt is like losing weight- you won’t lose 50 kgs in a month! Set realistic goals in reasonable timeframes. Debt works the same way.").save

    savings.tips.build(summary: "Cutting back",body: " Don’t cut back on essential spending, but make a conscious effort to sacrifice. You will be thankful when an emergency occurs (or when you have enough saved to retire, move, etc.).").save
    savings.tips.build(summary: "10%",body: " An easy number to start saving is 10% of your income.").save
    savings.tips.build(summary: "What to save",body: " After you’ve subtracted your essential costs and budgeted for extras from your income, save the rest.").save
    savings.tips.build(summary: "Debts or saving?",body: " Pay off debts before putting money into a savings fund.").save

    essentialsVsExtras.tips.build(summary: "Ask yourself",body: " When you are going to make a purchase, ask yourself.. Why do I want it? How would things be different if I had it? What other things would change if I had it (for better or worse)? Is this truly important to me?").save
    essentialsVsExtras.tips.build(summary: "Adjustments",body: " You may need to make adjustments to your budget for visits to family or getting your car fixed, but remember to subtract amounts from other areas if you do.").save
    essentialsVsExtras.tips.build(summary: "Cutting back",body: " Cutting back on multiple things feels easier than cutting out something entirely.").save

    smart.tips.build(summary: "Specific",body: "Set goals that are specific enough to plan out the steps to get there.").save
    smart.tips.build(summary: "Measurable",body: "Keep track of how close you are to your goal. For example, you want to buy a car that costs R100,000 and you have saved R20,000 so far.").save
    smart.tips.build(summary: "Attainable",body: " Make sure you set small goals on the way to achieving your main goal. If you need to save R100,000 for a new car, set aside a certain amount of money each week for that goal.").save
    smart.tips.build(summary: "Relevant",body: " Make sure your goal is something that will benefit you. If you want a R100,000 car, but can easily ride to work with a friend or take a taxi instead, you might want to rethink saving for a car.").save
    smart.tips.build(summary: "Time",body: " Setting an end date for your goal will help you stay motivated to achieve it.").save

