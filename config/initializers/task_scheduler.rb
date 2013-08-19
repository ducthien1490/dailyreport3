scheduler = Rufus::Scheduler.start_new

scheduler.cron '0 17 * * 1-5' do
	@managers=User.where(manager_group: true)
	@managers.each do |manager|
		@users = User.where(group_id: manager.group_id)
		#binding.pry
		@users.each do |user|
			@answers = Answer.where(user_id: user.id)
			ManagerMailer.sending_dailyreport(manager,user).deliver
		end
	end
end