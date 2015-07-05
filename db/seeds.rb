# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


    user = User.new(email: "user@user.com", password: "password", number: "+12316468691", firstname: "userfname", lastname: "userLname")
    vendor = Vendor.new(email: "vendor@vendor.com", password: "password", number: "+12316468691", firstname: "userfname", lastname: "userLname")

    user.save
    vendor.save

    acc1 = user.accounts.build(balance: 0.0, account_id: "AAAA", pin: 1234)
    acc2 = vendor.accounts.build(balance: 0.0, account_id: "AAAA", pin: 1234)

    acc1.save
    acc2.save
