class MemberController < ApplicationController
    before_action :member


    def get_history

        clan_history=@clan.clan_history.where(:clan_history_delete_id => nil)
        history=[]
        clan_history.each do |x|
            if !x.history.clan_history_edit_id 
                history.push(x)
            end
            
        end
        render json:{history:history}
    end

    def record_history
        clan_history=ClanHistory.create(
            :clan_id => @clan.id
        )
        history=History.new(
            :title => params[:title],
            :details => params[:details],
            :clan_history_id => clan_history.id
        )
        if history.save
            render json:{message:'History is recorded'}
        else
            clan_history.destroy
            render json:{error:'History is not recorded'}, status:400
        end
    end

    def clan_history_edit
        history=History.find(params[:history_id])


        clan_edit=ClanHistoryEdit.create(
            :approved => false,
            :reason => params[:reason],
            :edit_id => @clan.edit.id
        )

        edit=HistoryEdit.new(
            :title => params[:title],
            :details => params[:details],
            :clan_history_edit_id => clan_edit.id
        )
        if edit.save
             user_detail=UserDetail.create(
                        :name => @user.first_name.capitalize+ ' '+@user.middle_name.first.capitalize+". "+@user.last_name.capitalize,
                        :user_id => @user.id,
                        :clan_history_edit_id => clan_edit.id
                    )

            history.update(
                :clan_history_edit_id => clan_edit.id
            )
            render json:{message:"Edit is requested successfully"}
        else
            clan_edit.destroy
            render json:{error:"Edit not saved"}, status:400
        end
    end

    def family_history_edit
        history=History.find(params[:history_id])


        family_edit=FamilyHistoryEdit.create(
            :approved => false,
            :reason => params[:reason],
            :edit_id => @clan.edit.id
        )

        edit=HistoryEdit.new(
            :title => params[:title],
            :details => params[:details],
            :family_history_edit_id => family_edit.id
        )
        if edit.save
             user_detail=UserDetail.create(
                        :name => @user.first_name.capitalize+ ' '+@user.middle_name.first.capitalize+". "+@user.last_name.capitalize,
                        :user_id => @user.id,
                        :family_history_edit_id => family_edit.id
                    )

            history.update(
                :family_history_edit_id => family_edit.id
            )
            render json:{message:"Edit is requested successfully"}
        else
            clan_edit.destroy
            render json:{error:"Edit not saved"}, status:400
        end
    end

    def memory_history_edit
        history=History.find(params[:history_id])


        memory_edit=MemoryEdit.create(
            :approved => false,
            :reason => params[:reason],
            :edit_id => @clan.edit.id
        )

        edit=HistoryEdit.new(
            :title => params[:title],
            :details => params[:details],
            :memory_edit_id => memory_edit.id
        )
        if edit.save
             user_detail=UserDetail.create(
                        :name => @user.first_name.capitalize+ ' '+@user.middle_name.first.capitalize+". "+@user.last_name.capitalize,
                        :user_id => @user.id,
                        :memory_edit_id => memory_edit.id
                    )

            history.update(
                :memory_edit_id => memory_edit.id
            )
            render json:{message:"Edit is requested successfully"}
        else
            clan_edit.destroy
            render json:{error:"Edit not saved"}, status:400
        end
    end    

    # def clan_details_edit
    #     clan_detail=@clan.clan_detail

    #     details_edit=ClanDetailsEdit.new(
    #         :name => params[:name],
    #         :details => params[:details],
    #         :reason => params[:reason],
    #         :approved =>false,
    #         :edit_id => @clan.edit.id
    #     )

    #     if details_edit.save
    #         clan_detail.update(
    #             :clan_details_edit_id => details_edit.id
    #         )
    #         render json:{message:"Edit is saved"}
    #     else
    #         render json:{error:"Edit not saved"}, status:400
    #     end
    # end

    def show_edits
        family_history=@clan.edit.family_history_edit.where(:approved => false)
        clan_history=@clan.edit.clan_history_edit.where(:approved => false)
        memory=@clan.edit.memory_edit.where(:approved => false)
        details=@clan.edit.clan_details_edit
        family=@clan.edit.family_edit
        partner=@clan.edit.partner_edit


        family_history_delete=@clan.delete_collection.family_history_delete
        clan_history_delete=@clan.delete_collection.clan_history_delete
        memory_delete=@clan.delete_collection.memory_delete
        family_delete=@clan.delete_collection.family_delete
        partner_delete=@clan.delete_collection.partner_delete
   

        render json:{family_history:family_history,
            clan_history:clan_history,
            memory:memory, 
            details:details, 
            family:family,
            partner:partner,
            family_history_delete:family_history_delete,
            clan_history_delete:clan_history_delete,
            memory_delete:memory_delete,
            family_delete:family_delete,
            partner_delete:partner_delete
        }
    end

    def get_memories
        clan_history=@clan.memory.where(:memory_delete_id => nil)
        memory=[]
        clan_history.each do |x|
            if !x.history.memory_edit_id 
                memory.push(x)
            end
            
        end
        render json:{memory:memory}
    end

    def record_memory
        clan_memory=Memory.create(
            :clan_id => @clan.id
        )
        history=History.new(
            :title => params[:title],
            :details => params[:details],
            :memory_id => clan_memory.id
        )
        if history.save
            render json:{message:'Memory is recorded'}
        else
            clan_memory.destroy
            render json:{error:'Memory is not recorded'}, status:400
        end
    end

    def history_comment
        edit=HistoryEdit.find(params[:edit_id])
        comment=Comment.new(
            :details => params[:details],
            :history_edit_id => edit.id
        )
        if comment.save
            user_detail=UserDetail.create(
                        :name => @user.first_name.capitalize+ ' '+@user.middle_name.first.capitalize+". "+@user.last_name.capitalize,
                        :user_id => @user.id,
                        :comment_id => comment.id
                    )
            render json:{message:"Comment is successfully stored"}
        else
            comment.destroy
            render json:{error:"Comment is not Stored"}, status:400
        end
    end

    def register_person
        if params[:parent_id]
            parent=Child.create(
                :partner_id => params[:parent_id]
            )

            family=Family.create(
                # :name => params[:name].split(" ").first,
                :clan_id=>@clan.id,
                :child_id =>parent.id,
                :parentId => params[:family_id]
                
            )
            person=Person.new(
                :name => params[:name],
                :status => params[:status],
                :family_id => family.id
                
            )

        else
            family=Family.create(
                :clan_id=>@clan.id
            )

            person=Person.new(
                :name => params[:name],
                :status => params[:status],
                :family_id => family.id
            
            )
         end

        
        if person.save
            render json:{message:params[:name] + " is registered"}
        else
            family.destroy
            render json:{error:"Person Error"} , status:400
        end
    end

    def get_parent

        family=@clan.family.where(:has_children == true)
        # family=@clan.family

        parent=[]
        family.each do |x|
           parent.push(person:x,partner: x.partner.where(:has_children == true))
        end
        # render json:{family:parent,person:family}
        render json:{family:family}
    end
     
    def register_partner

        partner=Partner.new(
            :partner => params[:name],
            :status => params[:status],
            :has_children => params[:has_children],
            :person_id => params[:person_id]
        )
        if partner.save
            render json:{message:"partner is registered"}
        else
            render json:{error:"Partner Error"}
        end

    end

    def ancestral_tree
        tree=@clan.family
        # render json:{tree:Child.all}
        render json:{family:tree}
    end

    def record_family_story
        family_history=FamilyHistory.create(
            :family_id =>params[:family_id]
        )
       history=History.new(
        :family_history_id => family_history.id,
        :title => params[:title],
        :details => params[:details],
       )

       if history.save
            render json:{message:"Story is recorded"}
       else
            family_history.destroy
            render json:{error:"history error"}
       end
    end

    def clan_details
        details='Edit in Process'
        branch=@clan.branch_clan
        if @clan.clan_detail.clan_details_edit_id== nil
            details =@clan.clan_detail
        end
        render json:{details:details, branch:branch}
    end



    def clan_detail_edit
        clan_detail=@clan.clan_detail
        clan_details_edit=ClanDetailsEdit.new(
            :name => params[:name],
            :details => params[:details],
            :reason => params[:reason],
            :edit_id => @clan.edit.id
        )
        if clan_details_edit.save
            user_detail=UserDetail.create(
                        :name => @user.first_name.capitalize+ ' '+@user.middle_name.first.capitalize+". "+@user.last_name.capitalize,
                        :user_id => @user.id,
                        :clan_details_edit_id => clan_details_edit.id
                    )
            clan_detail.update(
                :clan_details_edit_id => clan_details_edit.id
            )
         render json:{message:"Edit is saved"}
        else
            render json:{error:"Edit not saved"}, status:400
        end

    end

    def edit_partner
        partner=Partner.find(params[:partner_id])
        partner_edit=PartnerEdit.new(
            :name => params[:name],
            :status => params[:status],
            :reason => params[:reason],
            :edit_id => @clan.edit.id
        )
        if partner_edit.save
            user_detail=UserDetail.create(
                        :name => @user.first_name.capitalize+ ' '+@user.middle_name.first.capitalize+". "+@user.last_name.capitalize,
                        :user_id => @user.id,
                        :partner_edit_id => partner_edit.id
                    )
            partner.update(
                :partner_edit_id => partner_edit.id
            )
             render json:{message:"Edit is requested successfully"}
        else
            render json:{error:"Edit not saved"}, status:400
        end
    end

    def edit_family
        family=Family.find(params[:family_id])
        family_edit=FamilyEdit.new(
            :name => params[:name],
            :status => params[:status],
            :reason => params[:reason],
            :edit_id => @clan.edit.id
        )
        if family_edit.save
            user_detail=UserDetail.create(
                        :name => @user.first_name.capitalize+ ' '+@user.middle_name.first.capitalize+". "+@user.last_name.capitalize,
                        :user_id => @user.id,
                        :family_edit_id => family_edit.id
                    )
            family.update(
                :family_edit_id => family_edit.id
            )
             render json:{message:"Edit is requested successfully"}
        else
            render json:{error:"Edit not saved"}, status:400
        end
    end

    def delete_family
        family=Family.find(params[:family_id])
        family_delete=FamilyDelete.new(
            :reason => params[:reason],
            :delete_collection_id =>@clan.delete_collection.id
        )
        if family_delete.save
            user_detail=UserDetail.create(
                        :name => @user.first_name.capitalize+ ' '+@user.middle_name.first.capitalize+". "+@user.last_name.capitalize,
                        :user_id => @user.id,
                        :family_delete_id => family_delete.id
                    )
            family.update(
                :family_delete_id => family_delete.id
            )
            render json:{message:"Delete is requested successfully"}
        else
            render json:{error:"Failed to delete"}, status:400
        end
    end

    def delete_partner
        partner=Partner.find(params[:partner_id])
        partner_delete=PartnerDelete.new(
            :reason => params[:reason],
            :delete_collection_id =>@clan.delete_collection.id
        )
        if partner_delete.save
            user_detail=UserDetail.create(
                        :name => @user.first_name.capitalize+ ' '+@user.middle_name.first.capitalize+". "+@user.last_name.capitalize,
                        :user_id => @user.id,
                        :partner_delete_id => partner_delete.id
                    )
            partner.update(
                :partner_delete_id => partner_delete.id
            )
            render json:{message:"Delete is requested successfully"}
        else
            render json:{error:"Failed to delete"}, status:400
        end
    end

    def delete_clan_history
        clan_history=ClanHistory.find(params[:clan_history_id])
        clan_history_delete=ClanHistoryDelete.new(
            :reason => params[:reason],
            :delete_collection_id => @clan.delete_collection.id
        )
        if clan_history_delete.save
            user_detail=UserDetail.create(
                        :name => @user.first_name.capitalize+ ' '+@user.middle_name.first.capitalize+". "+@user.last_name.capitalize,
                        :user_id => @user.id,
                        :clan_history_delete_id => clan_history_delete.id
                    )
            clan_history.update(
                :clan_history_delete_id => clan_history_delete.id
            )
            render json:{message:"Delete is requested successfully"}
        else
            render json:{error:"Failed to delete"}, status:400
        end
    end

    def delete_family_history
        family_history=FamilyHistory.find(params[:family_history_id])
        family_history_delete=FamilyHistoryDelete.new(
            :reason => params[:reason],
            :delete_collection_id =>@clan.delete_collection.id
        )
        if family_history_delete.save
            user_detail=UserDetail.create(
                        :name => @user.first_name.capitalize+ ' '+@user.middle_name.first.capitalize+". "+@user.last_name.capitalize,
                        :user_id => @user.id,
                        :family_history_delete_id => family_history_delete.id
                    )
            family_history.update(
                :family_history_delete_id => family_history_delete.id
            )
            render json:{message:"Delete is requested successfully"}
        else
            render json:{error:"Failed to delete"}, status:400
        end
    end

    def delete_memory
        memory=Memory.find(params[:memory_id])
        memory_delete=MemoryDelete.new(
            :reason => params[:reason],
            :delete_collection_id =>@clan.delete_collection.id
        )
        if memory_delete.save
            user_detail=UserDetail.create(
                        :name => @user.first_name.capitalize+ ' '+@user.middle_name.first.capitalize+". "+@user.last_name.capitalize,
                        :user_id => @user.id,
                        :memory_delete_id => memory_delete.id
                    )
            memory.update(
                :memory_delete_id => memory_delete.id
            )
            render json:{message:"Delete is requested successfully"}
        else
            render json:{error:"Failed to delete"}, status:400
        end
    end



    def clan_details_comment
        edit=ClanDetailsEdit.find(params[:clan_details_edit_id])
        comment=Comment.new(
            :details => params[:details],
            :clan_details_edit_id => edit.id
        )
        if comment.save
            user_detail=UserDetail.create(
                        :name => @user.first_name.capitalize+ ' '+@user.middle_name.first.capitalize+". "+@user.last_name.capitalize,
                        :user_id => @user.id,
                        :comment_id => comment.id
                    )
            render json:{message:"Comment is successfully stored"}
        else
            comment.destroy
            render json:{error:"Comment is not Stored"}, status:400
        end
    end

    def person_comment
         comment=Comment.new(
            :details => params[:details],
            :family_edit_id => params[:family_edit_id]
        )

        if comment.save
            user_detail=UserDetail.create(
                        :name => @user.first_name.capitalize+ ' '+@user.middle_name.first.capitalize+". "+@user.last_name.capitalize,
                        :user_id => @user.id,
                        :comment_id => comment.id
                    )
            render json:{message:"Comment is successfully stored"}
        else
            comment.destroy
            render json:{error:"Comment is not Stored"}, status:400
        end

    end

    def partner_comment
        comment=Comment.new(
            :details => params[:details],
            :partner_edit_id => params[:partner_edit_id]
        )

        if comment.save
            user_detail=UserDetail.create(
                        :name => @user.first_name.capitalize+ ' '+@user.middle_name.first.capitalize+". "+@user.last_name.capitalize,
                        :user_id => @user.id,
                        :comment_id => comment.id
                    )
            render json:{message:"Comment is successfully stored"}
        else
            comment.destroy
            render json:{error:"Comment is not Stored"}, status:400
        end
    end

    def delete_person_comment
         comment=Comment.new(
            :details => params[:details],
            :family_delete_id => params[:family_delete_id]
        )

        if comment.save
            user_detail=UserDetail.create(
                        :name => @user.first_name.capitalize+ ' '+@user.middle_name.first.capitalize+". "+@user.last_name.capitalize,
                        :user_id => @user.id,
                        :comment_id => comment.id
                    )
            render json:{message:"Comment is successfully stored"}
        else
            comment.destroy
            render json:{error:"Comment is not Stored"}, status:400
        end

    end

    def delete_partner_comment
        comment=Comment.new(
            :details => params[:details],
            :partner_delete_id => params[:partner_delete_id]
        )

        if comment.save
            user_detail=UserDetail.create(
                        :name => @user.first_name.capitalize+ ' '+@user.middle_name.first.capitalize+". "+@user.last_name.capitalize,
                        :user_id => @user.id,
                        :comment_id => comment.id
                    )
            render json:{message:"Comment is successfully stored"}
        else
            comment.destroy
            render json:{error:"Comment is not Stored"}, status:400
        end
    end

    def delete_clan_history_comment
        comment=Comment.new(
            :details => params[:details],
            :clan_history_delete_id => params[:clan_history_delete_id]
        )
        if comment.save
            user_detail=UserDetail.create(
                        :name => @user.first_name.capitalize+ ' '+@user.middle_name.first.capitalize+". "+@user.last_name.capitalize,
                        :user_id => @user.id,
                        :comment_id => comment.id
                    )
            render json:{message:"Comment is successfully stored"}
        else
            comment.destroy
            render json:{error:"Comment is not Stored"}, status:400
        end
    end

    def delete_family_history_comment
        comment=Comment.new(
            :details => params[:details],
            :family_history_delete_id => params[:family_history_delete_id]
        )
        if comment.save
            user_detail=UserDetail.create(
                        :name => @user.first_name.capitalize+ ' '+@user.middle_name.first.capitalize+". "+@user.last_name.capitalize,
                        :user_id => @user.id,
                        :comment_id => comment.id
                    )
            render json:{message:"Comment is successfully stored"}
        else
            comment.destroy
            render json:{error:"Comment is not Stored"}, status:400
        end
    end

    def delete_memory_comment
        comment=Comment.new(
            :details => params[:details],
            :memory_delete_id => params[:memory_delete_id]
        )
        if comment.save
            user_detail=UserDetail.create(
                        :name => @user.first_name.capitalize+ ' '+@user.middle_name.first.capitalize+". "+@user.last_name.capitalize,
                        :user_id => @user.id,
                        :comment_id => comment.id
                    )
            render json:{message:"Comment is successfully stored"}
        else
            comment.destroy
            render json:{error:"Comment is not Stored"}, status:400
        end
    end


   

end
