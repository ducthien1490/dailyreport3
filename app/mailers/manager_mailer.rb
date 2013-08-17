class ManagerMailer < ActionMailer::Base  

  default :from => "cktdailyreport.test@gmail.com"        
    def sending_dailyreport(manager, user)
      @manager = manager
      @user = user
      @title =  ["[", @user.name, "]","[Daily report]",Date.current.strftime("20%y-%m-%d")].join(" ")
      mail(:to => @manager.email, :subject => @title)  
    end  

    def sending_users_report
      @managers = User.where(manager_group: true)
      @managers.each do |manager|
        @users = User.where(group_id: manager.group_id)
        @users.each do |user|
          @answers = Answer.where(user_id: user.id)
          @title =  ["[", user.name, "]","[Daily report]",Date.current.strftime("20%y-%m-%d")].join(" ")
          mail(:to => manager.email, :subject => @title)
        end
      end
    end

end
