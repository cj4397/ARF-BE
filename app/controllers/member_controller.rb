class MemberController < ApplicationController
    before_action :member
    def request_edit
    end

    def get_history

        history=@clan.clan_history
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

    def edit_history
        history=History.find(params[:history_id])

        edit=Edit.new(
            :title => params[:title],
            :details => params[:details],
            :approved =>false,
            :clan_id => @clan.id
        )
        if edit.save
             user_detail=UserDetail.create(
                        :name => @user.first_name.capitalize+ ' '+@user.middle_name.first.capitalize+". "+@user.last_name.capitalize,
                        :user_id => @user.id,
                        :edit_id => edit.id
                    )

            history.update(
                :edit_id => edit.id
            )
            render json:{message:"Edit is saved", edit:Edit.all}
        else
            render json:{error:"Edit not saved"}, status:400
        end
    end

    def show_edits
        edit=@clan.edit.where(:approved => false)

        render json:{edit:edit}
    end

    def get_memories
        memory=@clan.memory
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

    def comment
        edit=Edit.find(params[:edit_id])
        comment=Comment.new(
            :details => params[:details],
            :edit_id => edit.id
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
        
                :parentId => params[:family_id]
                
            )
        else
            family=Family.create(
                :clan_id=>@clan.id
            )
         end

        person=Person.new(
            :name => params[:name],
            :status => params[:status],
            :family_id => family.id
        )
        if person.save
            render json:{message:params[:name] + " is registered", person:person}
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
        details =@clan.clan_detail
        render json:{details:details}
    end

end
