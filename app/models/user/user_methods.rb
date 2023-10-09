class User::UserMethods
  def initialize(user,clan)
       
    @user_list=[]
    @clan_list=[]
    user.each do |x|
      @user_list.push(x.id)
    end
    clan.each do |x|
      @clan_list.push(x.id)
    end
  end

def check
   @user_list.intersect?(@clan_list)
end

def intersected_in
  @user_list.intersection(@clan_list)
 end



end