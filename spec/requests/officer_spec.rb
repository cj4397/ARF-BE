require 'rails_helper'

RSpec.describe "Officers", type: :request do
  describe "POST officer#clan_join_requests" do
     before do
        post '/sign-up', params: {
            user:{
                  	first_name:"Admin_admin",
                    middle_name:"middle",
                    last_name:"last",
                    email:"email@email.com",
                    password:"password"
              }
          }

          json_response = JSON.parse(response.body)
          @token=json_response['token']

        post '/clan_request', params:{
                token: @token,
                clan_name:"Clan"
        }

        post '/clan_creation', params:{
                token: @token,
                clan_request_id:1
        }
      end

      it "Show all Clan Join Request" do
        post '/officer_join_request', params:{
                    token: @token,
                    clan:"Clan"
            }

            expect(response).to have_http_status :ok
            json_response = JSON.parse(response.body)
            expect(json_response.keys).to match_array(["request"])
      end


  end
end
