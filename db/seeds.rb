# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
    
    Profile.delete_all
    Account.delete_all
    Client.delete_all

    #client = Client.new(email: "user@user.com", password: "password", number: "+12316468691")
    #client2 = Client.new(email: "user2@user2.com", password: "password", number: "+12316468691")

    client = Client.new(password: "password", number: "+15712787457")
    client2 = Client.new(password: "password", number: "+27836538932")
    
    client.save
    client2.save

    acc1 = client.build_account(balance: 0.0, account_id: "AAAA", pin: 1234)
    acc2 = client2.build_account(balance: 0.0, account_id: "BBBB", pin: 1234)

    acc1.save
    acc2.save

    prof1 = Cprofile.new(client: client,firstname: "Amanda", lastname: "Halacy", age: 18)
    prof2 = Vprofile.new(client: client2, businessname: "TestBusiness inc.")

    prof1.save
    prof2.save


 
