namespace :db do 
	desc "Fill database with sample data"
	task populate: :environment do
		make_users
		make_answers
		make_catalogs
	end
end

def make_users
	firstuser = User.create!(name: "Duc Thien", email: "to.duc.thien@framgia.com", password:"123456",password_confirmation: "123456", group_id: "1", admin: true, active: true)
	seconduser = User.create!(name: "Khanh",email: "duy.khanh@framgia.com",password: "123456", password_confirmation: "123456", active: true, manager_group: true, group_id: "2")
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

def make_catalogs
	
end


def make_answers

end

