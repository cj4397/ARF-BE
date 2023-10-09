class UsersController < ApplicationController

      before_action :check_auth, only: [:clan_proposal, :admin_clan_creation, :admin_branch_creation, :admin]
      before_action :member,only: :branch_creation_request

#               For ADMIN
    def clan_proposal
        clan_request=ClanCreation.where(:approved => false)
        branch_request=BranchCreation.where(:approved => false)
        render json:{Clans:clan_request,Branch:branch_request}
    end

    def admin_clan_creation
       
        clan_request=ClanCreation.find(params[:clan_request_id])
        if clan_request
            user=User.find(clan_request.user_detail.user_id)
            request=Request.find(clan_request.request.id)

            clan=Clan.create()

            details=ClanDetail.new(
                :name => request.name,
                :clan_id => clan.id
            )

            member=Member.new(
                    :officer => true,
                    :clan_id => clan.id,
                    :user_id => user.id
                )

            if details.save && member.save
                
                    clan_request.update(
                        :approved => true
                    )
                    render json:{message:"Clan is created", clans:Clan.all}
                
            else
                 clan.destroy
                 render json: {error:"error details",clan:Clan.all, member:member},status:400
               
               
            end
        else
            render json: {error:'no such Request was made'}, status: 400
        end

    end

    def admin_branch_creation
        branch_request=BranchCreation.find(params[:branch_request_id])
        if branch_request
            user=User.find(branch_request.user_detail.user_id)
            request=Request.find(branch_request.request.id)
            main_clan_details=ClanDetail.find_by_name(request.main_clan)

            clan=Clan.create()

            branch_clan=BranchClan.new(
                :branch_clan_id => clan.id,
                :clan_id=>main_clan_details.clan_id
            )

            details=ClanDetail.new(
                :name => request.name,
                :clan_id => clan.id
            )

            member=Member.new(
                :officer => true,
                :clan_id => clan.id,
                :user_id => user.id
            )

            if details.save && member.save && branch_clan.save

                branch_request.update(
                    :approved => true
                )
                
                render json:{message:"Branch is created", clans:Clan.all}
            else
                clan.destroy
                render json: {error:"error", branches:BranchClan.all, clans:Clan.all},status:400
                
               
            end
        else
            render json: {message:'no such Request was made'}, status: 400
        end
    end

    def get_clans
         user=User.find_by_token(params[:token]) 
        if user
            if !user.member.empty?
                user_clans=[]
                user.member.each do |x|
                    user_clans.push(x.clan_detail.name)
                end
                render json: { clans:user_clans}
            else
                render json: {error:"no clan joined"}, status:400
            end
        else
            render json: {error:'not a user'}, status: 400
        end
    end

    def admin
        render json: {admin:true}
    end

                # For ALL
        # for searching Clans to join
    def show_clans
        user=User.find_by_token(params[:token]) 
        if user
            render json: {clans:ClanDetail.all}
        else
            render json:{error:"No such user exist"}
        end
    end
        
    def clan_creation_request
        user=User.find_by_token(params[:token]) 
        if user
            
            clan_request=ClanCreation.create(
                    :approved =>false
            )
            request=Request.new(
                :name => params[:clan_name],
                :clan_creation_id => clan_request.id
            )

            #  render json:{user_detail:user_detail,clan_request:clan_request}
            if request.save 
                user_detail=UserDetail.create(
                    :name => user.first_name.capitalize+ ' '+user.middle_name.first.capitalize+". "+user.last_name.capitalize,
                    :user_id => user.id,
                    :clan_creation_id => clan_request.id
                )
                
                render json:{message:"Request has been sent"}
            else
                clan_request.destroy
                render json: {message:"Clan name is already registered"},status:400
            end
        else
             render json: {message:'no such User'}, status: 400
        end
    end

    def branch_creation_request
        user=User.find_by_token(params[:token])
        # clan=Clan.find_by_name(params[:clan])
        # if user && clan
            # if user.member.include?(clan)
                    
                    branch_request=BranchCreation.create(
                        :approved =>false
                    )

                    request=Request.new(
                        :name => params[:branch_name],
                        :main_clan => params[:clan],
                        :branch_creation_id => branch_request.id
                    )
                    if request.save
                        user_detail=UserDetail.create(
                        :name => user.first_name.capitalize+ ' '+user.middle_name.first.capitalize+". "+user.last_name.capitalize,
                        :user_id => user.id,
                        :branch_creation_id => branch_request.id
                    )

                        render json:{message:"Request has been sent", branch_clan:BranchCreation.all, clan:ClanCreation.all}
                    else
                        branch_request.destroy
                        render json: {error:"Clan name is already registered",request:Request.all, branch_clan:BranchCreation.all, clan:ClanCreation.all},status:400
                    end
            # else
            #     render json: {error:'not member of main clan'}, status: 400
            # end
        # else
        #      render json: {error:'invalid token or clan'}, status: 400
        # end
    end

    def joining_request
        user=User.find_by_token(params[:token])
        clan_details=ClanDetail.find_by_name(params[:clan])
        if user
            
            request=ClanRequest.new(
                :details=>params[:details],
                :approved=>false,
                :clan_id=>clan_details.clan_id
            )
            if request.save
                user_detail=UserDetail.create(
                    :name => user.first_name.capitalize+ ' '+user.middle_name.first.capitalize+". "+user.last_name.capitalize,
                    :user_id => user.id,
                    :clan_request_id => request.id
                )
               
                render json:{message:'Request is sent to clan Officers'}
            else
                render json:{error:'Request error'},status:400
            end
            
        else
            render json: {error:'no such user'},status:400
        end
    end

    def create
            @user = User.new(user_params)
            @user.password = params[:password] 
            @user.admin 

            if  @user.save
                
                
                
                    if @user.check?
                        render json: { 
                            user:@user.first_name, 
                            token: @user.token, 
                            admin:true
                            }, status: 200
                    else
                      
                        # UserMailer.with(user: @user).welcome_email.deliver_now
                        render json: { 
                            user:@user.first_name, 
                            token: @user.token
                            }, status: 200
                     
                    end
               
            else
                render json:{ message: "Email invalid/duplicated", users:User.all, member:Member.all}, status: 400
            end 
    
    end

    def signin
        @user = User.find_by_email(params[:email])
        if @user
            if @user.password == params[:password]
               
                if @user.check?
                    render json: { 
                        user:@user.first_name, 
                        token: @user.token, 
                        admin:true,
                       
                        }, status: 200
                else
                    render json: { 
                        user:@user.first_name, 
                        token: @user.token,
                       
                   
                        }, status: 200
                end
            else
                render json: {error:'Wrong password'}, status: 400
            end
        else
            render json: {error:'no such email is registered'}, status: 400
        end
    end


    # def update
    #     @user = User.find_by_email(params[:email])
    #     if @user
    #         if @user.update(user_params)
    #             render json: { user:@user.name, token: @user.token}, status: 200
    #         else
    #             render json: {message: "Edit failed"},status:400
    #         end
    #     else
    #         render json: {message: "no such email is registered"},status:400
    #     end
    # end


    # def delete
    #     @user = User.find_by_email(params[:email])
    #     if @user
    #          @user.destroy
    #         render json: {message:"destroyed"}, status:200
    #     else
    #         render json: {message: "no such email is registered"}, status:400
    #     end
    # end

private
    def check_auth
        @user=User.find_by_token(params[:token])
        if @user
            unless @user.check?
                render json: {error:"unauthorized"}
            end
        else
            render json: {error:"invalid token"}, status:400
        end

    end


    def user_params
        params.require(:user).permit(
            :first_name, 
            :middle_name, 
            :last_name, 
            :email, 
            :password)
    end
end
