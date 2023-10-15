class OfficerController < ApplicationController
    before_action :verify_officer

    def check_officer
        render json:{officer:true}
    end
    
    def clan_join_requests
              
            clan_request=@clan.clan_request.where(:approved => false)
            render json:{request:clan_request, all:ClanRequest.all}
       
    end

   

    def accept_member
        clan_request=ClanRequest.find(params[:request_id])
        person=Person.find_by_id(params[:person]) 
     
            
            member=Member.new(
                
                :officer => params[:officer],
                :clan_id=> clan_request.clan_id,
                :user_id=> clan_request.user_detail.user_id,

            )

            if member.save
                clan_request.update(
                    :approved=>true
                )
                render json:{message:"Member successfully registered"}
            else
                render json:{message:"Member Params error"}, status:400
            end
            
        
    end

    
    
    

end
