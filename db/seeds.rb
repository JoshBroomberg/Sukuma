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


    Transaction.create!(customer_id: customer.id, vendor_id: business.id, amount: 150, state: :success, kind: :deposit)
    Transaction.create!(customer_id: customer.id, vendor_id: business2.id, amount: 120, state: :success, kind: :deposit)
    Transaction.create!(customer_id: customer.id, vendor_id: business3.id, amount: 130, state: :success, kind: :deposit)
    Transaction.create!(customer_id: customer.id, vendor_id: business4.id, amount: 140, state: :success, kind: :deposit)
    Transaction.create!(customer_id: customer.id, vendor_id: business5.id, amount: 160, state: :success, kind: :deposit)

    Transaction.create!(customer_id: customer.id, vendor_id: business.id, amount: 50, state: :success, kind: :purchase)
	Transaction.create!(customer_id: customer.id, vendor_id: business2.id, amount: 20, state: :success, kind: :purchase)
	Transaction.create!(customer_id: customer.id, vendor_id: business3.id, amount: 30, state: :success, kind: :purchase)
	Transaction.create!(customer_id: customer.id, vendor_id: business4.id, amount: 40, state: :success, kind: :purchase)
	Transaction.create!(customer_id: customer.id, vendor_id: business5.id, amount: 60, state: :success, kind: :purchase)
	Transaction.create!(customer_id: customer.id, vendor_id: business.id, amount: 70, state: :success, kind: :purchase)
	Transaction.create!(customer_id: customer.id, vendor_id: business2.id, amount: 90, state: :success, kind: :purchase)

