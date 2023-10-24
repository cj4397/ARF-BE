class OfficerController < ApplicationController
    before_action :verify_officer

    def check_officer
        render json:{officer:true}
    end
    
    def clan_join_requests
              
            clan_request=@clan.clan_request.where(:approved => false)
            render json:{request:clan_request}
       
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

    def accept_clan_history_edit
        clan_history_edit=ClanHistoryEdit.find(params[:clan_history_edit_id])
        history=clan_history_edit.history
        history_edit=clan_history_edit.history_edit

        history.update(
            :title => history_edit.title,
            :details => history_edit.details,
            :clan_history_edit_id => nil
        )

        clan_history_edit.destroy
        render json: {message:'Edit is approved'}
       

    end

    def accept_family_history_edit
        family_history_edit=FamilyHistoryEdit.find(params[:family_history_edit_id])
        history=family_history_edit.history
        history_edit=family_history_edit.history_edit

        history.update(
            :title => history_edit.title,
            :details => history_edit.details,
            :family_history_edit_id => nil
        )

        family_history_edit.destroy
        render json: {message:'Edit is approved'}
    end

    def accept_memory_edit
        memory_edit=MemoryEdit.find(params[:memory_edit_id])
        history=memory_edit.history
        history_edit=memory_edit.history_edit

        history.update(
            :title => history_edit.title,
            :details => history_edit.details,
            :memory_edit_id => nil
        )

        memory_edit.destroy
        render json: {message:'Edit is approved'}
    end

    def edit_clan_history_edit
        clan_history_edit=ClanHistoryEdit.find(params[:clan_history_edit_id])
        history_edit=clan_history_edit.history_edit

        history_edit.update(
            :title => params[:title],
            :details => params[:details]
        )

        render json: {message:"Successful edit"}
    end

    def edit_memory_edit
        memory_edit=MemoryEdit.find(params[:memory_edit_id])
        history_edit=memory_edit.history_edit

        history_edit.update(
            :title => params[:title],
            :details => params[:details]
        )

        render json: {message:"Successful edit"}
    end

    
    def edit_family_history_edit
        family_history_edit=FamilyHistoryEdit.find(params[:family_history_edit_id])
        history_edit=family_history_edit.history_edit

        history_edit.update(
            :title => params[:title],
            :details => params[:details]
        )

        render json: {message:"Successful edit"}
    end

    

    def edit_family_edit
        family_edit=FamilyEdit.find(params[:family_edit_id])
        family_edit.update(
            :name => params[:name],
            :status => params[:status]
        )
        render json: {message:"Successful edit"}
    end

    def edit_partner_edit
        partner_edit=PartnerEdit.find(params[:partner_edit_id])
        partner_edit.update(
            :name => params[:name],
            :status => params[:status]
        )
        render json:{message:"Successful edit"}
    end


    def accept_clan_details_edit
        clan_details_edit=ClanDetailsEdit.find(params[:clan_details_edit_id])
        clan_detail=clan_details_edit.clan_detail
        clan_detail.update(
            :name => clan_details_edit.name,
            :details => clan_details_edit.details,
            :clan_details_edit_id => nil
        )
        clan_details_edit.destroy
        render json: {message:'Edit is approved'}
    end

    def accept_family_edit
        family_edit =FamilyEdit.find(params[:family_edit_id])
        family= family_edit.family
        person=family_edit.family.person
        person.update(
            :name => family_edit.name,
            :status => family_edit.status
        )

        family.update(
            :family_edit_id => nil
        )
        family_edit.destroy
        render json: {message:'Edit is approved'}
    end

    def accept_partner_edit
        partner_edit =PartnerEdit.find(params[:partner_edit_id])
        partner= partner_edit.partner
       
        partner.update(
            :partner => partner_edit.name,
            :status => partner_edit.status,
            :partner_edit_id => nil
        )

       
        partner_edit.destroy
        render json: {message:'Edit is approved'}
    end

    def accept_family_delete
        family_delete=FamilyDelete.find(params[:family_delete_id])
        family=family_delete.family
        family.destroy
        family_delete.destroy
        render json:{message:"Delete Successful"}
    end

    def accept_partner_delete
        partner_delete=PartnerDelete.find(params[:partner_delete_id])
        partner=partner_delete.partner
        partner.destroy
        partner_delete.destroy
        render json:{message:"Delete Successful"}
    end

    def accept_family_history_delete
        family_history_delete=FamilyHistoryDelete.find(params[:family_history_delete_id])
        family_history=family_history_delete.family_history
        family_history.destroy
        family_history_delete.destroy
        render json:{message:"Delete Successful"}
    end

    def accept_clan_history_delete
        clan_history_delete=ClanHistoryDelete.find(params[:clan_history_delete_id])
        clan_history=clan_history_delete.clan_history
        clan_history.destroy
        clan_history_delete.destroy
        render json:{message:"Delete Successful"}
    end

    def accept_memory_delete
        memory_delete=MemoryDelete.find(params[:memory_delete_id])
        memory=memory_delete.memory
        memory.destroy
        memory_delete.destroy
        render json:{message:"Delete Successful"}
    end

    def cancel_delete_family
        
        family_delete=FamilyDelete.find(params[:family_delete_id])
        family=family_delete.family
        family.update(
            :family_delete_id => nil
        )
        family_delete.destroy
        
      
        
        render json:{message:'Cancelation is successful'}
        
    end

    def cancel_delete_partner

        partner_delete=PartnerDelete.find(params[:partner_delete_id])
        partner=partner_delete.partner
        partner.update(
            :partner_delete_id => nil
        )
        partner_delete.destroy
        render json:{message:'Cancelation is successful'}
    end

    def cancel_delete_clan_history
        clan_history_delete=ClanHistoryDelete.find(params[:clan_history_delete_id])
        
        clan_history=clan_history_delete.clan_history
        clan_history.update(
            :clan_history_delete_id => nil
        )
        
        clan_history_delete.destroy
        render json:{message:'Cancelation is successful'}

    end

    def cancel_delete_family_history
        family_history_delete=FamilyHistoryDelete.find(params[:family_history_delete_id])
        
        family_history=family_history_delete.family_history
        family_history.update(
            :family_history_delete_id => nil
        )
        
        family_history_delete.destroy
        render json:{message:'Cancelation is successful'}
    end

    def cancel_delete_memory
        memory_delete=MemoryDelete.find(params[:memory_delete_id])
        
        memory=memory_delete.memory
        memory.update(
            :memory_delete_id => nil
        )
        
        memory_delete.destroy
        render json:{message:'Cancelation is successful'}
    end
    
    def cancel_family_edit
        family_edit = FamilyEdit.find(params[:family_edit_id])
        family=family_edit.family
        family.update(
            :family_edit_id=> nil
        )
        family_edit.destroy
        render json:{message:'Cancelation is successful'}
    end

    def cancel_partner_edit
        partner_edit = PartnerEdit.find(params[:partner_edit_id])
        partner=partner_edit.partner
        partner.update(
            :partner_edit_id=> nil
        )
        partner_edit.destroy
        render json:{message:'Cancelation is successful'}
    end

    def cancel_family_history_edit
        family_history_edit = FamilyHistoryEdit.find(params[:family_history_edit_id])
        history=family_history_edit.history
        history.update(
            :family_history_edit_id=> nil
        )
        family_history_edit.destroy
        render json:{message:'Cancelation is successful'}
    end

    def cancel_clan_history_edit
        clan_history_edit = ClanHistoryEdit.find(params[:clan_history_edit_id])
        history=clan_history_edit.history
        history.update(
            :clan_history_edit_id=> nil
        )
        clan_history_edit.destroy
        render json:{message:'Cancelation is successful'}
    end

    def cancel_memory_edit
        memory_edit = MemoryEdit.find(params[:memory_edit_id])
        history=memory_edit.history
        history.update(
            :memory_edit_id=> nil
        )
        memory_edit.destroy
        render json:{message:'Cancelation is successful'}
    end

    def cancel_clan_details_edit
        clan_details_edit =ClanDetailsEdit.find(params[:clan_details_edit_id])
        clan_details=clan_details_edit.clan_detail
        clan_details.update(
            :clan_details_edit_id=> nil
        )
        clan_details_edit.destroy
        render json:{message:'Cancelation is successful'}
    end

     def edit_clan_details_edit
        clan_details_edit=ClanDetailsEdit.find(params[:clan_details_edit_id])
        clan_details_edit.update(
            :name => params[:name],
            :details => params[:details]
        )
        render json: {message:"Successful edit"}
    end
    

end
