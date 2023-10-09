class ApplicationController < ActionController::API

    def member
        @user=User.find_by_token(params[:token])
        clan_details=ClanDetail.find_by_name(params[:clan])
        
        if @user && clan_details
            
            @clan=Clan.find(clan_details.clan_id)
           clan_joined=@user.member.where(:clan_id == @clan.id)
            #  clan_joined=user.member.include?(clan)
      

                # unless clan_joined # if the user has joined the clan already?
                unless !clan_joined.empty?
                    render json: {error:"unauthorized", clan:@clan, user:@user}, status:400
                end
        else
            render json: {error:'no such User/clan'}, status: 400
        end
    end

    def verify_officer
        @user=User.find_by_token(params[:token])
        clan_details=ClanDetail.find_by_name(params[:clan])
        if @user && clan_details
            @clan=Clan.find(clan_details.clan_id)
            # checker=User::UserMethods.new(user.member,clan.member)
            clan_joined=@user.member.where(:clan_id == @clan.id)
            # clan_joined= checker.check
                if !clan_joined.empty?
                    # @member=Member.find_by_id(checker.intersected_in)
                    # unless @member.officer
                    unless clan_joined.first.officer
                        render json: {error:"unauthorized"}, status:400
                    end
            # render json: {error:clan_joined.first}

                else
                    render json: {error:"not a member"}, status:400
                end
        else
            render json: {error:'no such clan or not officer'}, status: 400
        end
    end
end
