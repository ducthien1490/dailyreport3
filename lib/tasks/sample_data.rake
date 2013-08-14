namespace :db do 
	desc "Fill database with sample data"
	task populate: :environment do
		make_users
	end
end

def make_users
	firstuser = User.create!(name: "Chuyen", email: "vu.van.chuyen@framgia.com", password:"foobar",password_confirmation: "foobar", group_id: "1")
	5.times do |n|
		name = Faker::Name.name
		email = "example#{n+1}@framgia.com"
		password ="123456"
		group_id =1
		User.create!(name: name, email: email, password: password,password_confirmation: password,group_id: group_id)
	end
    5.times do |n|
		name = Faker::Name.name
		email = "example-#{n+1}@framgia.com"
		password ="123456"
		group_id =2
		User.create!(name: name, email: email, password: password,password_confirmation: password,group_id: group_id)
	end

	5.times do |n|
		name = Faker::Name.name
		email = "example--#{n+1}@framgia.com"
		password ="123456"
		group_id =3
		User.create!(name: name, email: email, password: password,password_confirmation: password,group_id: group_id)
	end
	5.times do |n|
		name = Faker::Name.name
		email = "example---#{n+1}@framgia.com"
		password ="123456"
		group_id =4
		User.create!(name: name, email: email, password: password,password_confirmation: password,group_id: group_id)
	end
	5.times do |n|
		name = Faker::Name.name
		email = "example----#{n+1}@framgia.com"
		password ="123456"
		group_id =0
		User.create!(name: name, email: email, password: password,password_confirmation: password,group_id: group_id)
	end
    
end