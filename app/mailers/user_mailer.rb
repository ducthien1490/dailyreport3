
    class UserMailer < ActionMailer::Base  
      default :from => "cktdailyreport3@gmail.com"  
      def registration_confirmation(user)
        @user=user  
        mail(:to => user.email, :subject => "Registered")  
      end  

      def active_by_admin(user,u_admin) ####### danh dau lai mai lam
      	 @user=user
        # @u_admin=u_admin  
      	 mail(:to => u_admin.email, :subject => "Active User")  
      end
     end

 
