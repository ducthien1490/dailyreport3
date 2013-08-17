

    class UserMailer < ActionMailer::Base  
      default :from => "cktdailyreport3@gmail.com"  
      
      def registration_confirmation(user)
        @user=user  
        mail(:to => user.email, :subject => "Registered")  
      end  
    end  