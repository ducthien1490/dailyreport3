namespace :db do 
	desc "Fill database with sample data"
	task populate: :environment do
		make_users
	end
end

def make_users
	firstuser = User.create!(name: "Duc Thien", email: "to.duc.thien@framgia.com", password:"12345678",password_confirmation: "12345678", group_id: "1")
	50.times do |n|
		name = Faker::Name.name
		email = "example.#{n+1}@framgia.com"
		password ="123456"
		group_id ="1"
		User.create!(name: name, email: email, password: password,password_confirmation: password,group_id: group_id)
	end
end