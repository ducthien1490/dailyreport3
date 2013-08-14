def join
      @group_id = params[:id]
      @user_id = params[:user_id]
      @newuser= GroupUser.new(:group_id => @group_id, :user_id => @user_id)
      @newuser.save
      redirect_to(:controller => 'groups', :action => 'show', :id => @group_id)
   end