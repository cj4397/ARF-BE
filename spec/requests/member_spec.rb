require 'rails_helper'

RSpec.describe "Members", type: :request do

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

    
 
  describe "POST member#get_history" do
     it 'Show the Clan History' do
            post '/clan_history', params:{
                    token: @token,
                    clan:"Clan"
            }
      
            expect(response).to have_http_status :ok
            json_response = JSON.parse(response.body)
            expect(json_response.keys).to match_array(["history"])

        end
  end

  describe "POST member#record_history" do
     it 'Record a Clan History' do
            post '/create_history', params:{
                    token: @token,
                    clan:"Clan",
                    title:"title",
                    details:"details"
            }
      
            expect(response).to have_http_status :ok
            expect(JSON.parse(response.body)).to eq ({"message"=>"History is recorded"})

        end
  end

  describe "POST member#edit_history" do

    before do
       post '/create_history', params:{
                    token: @token,
                    clan:"Clan",
                    title:"title",
                    details:"details"
            }
    end

     it 'Edit a History' do
            post '/edit_history', params:{
                    token: @token,
                    clan:"Clan",
                    title:"title",
                    history_id:1,
                    details:"details"
            }
      
            expect(response).to have_http_status :ok
            expect(JSON.parse(response.body)).to eq ({"message"=>"Edit is saved"})

        end
  end

  describe "POST member#show_edits" do
     it 'Show the Edits' do
            post '/edits', params:{
                    token: @token,
                    clan:"Clan"
            }
      
            expect(response).to have_http_status :ok
            json_response = JSON.parse(response.body)
            expect(json_response.keys).to match_array(["edit"])

        end
  end

  describe "POST member#get_memories" do
     it 'Show the Memories' do
            post '/memory', params:{
                    token: @token,
                    clan:"Clan"
            }
      
            expect(response).to have_http_status :ok
            json_response = JSON.parse(response.body)
            expect(json_response.keys).to match_array(["memory"])

        end
  end

  describe "POST member#record_memory" do
     it 'Record a Memories' do
            post '/create_memory', params:{
                    token: @token,
                    clan:"Clan",
                    title:"title",
                    details:"details"
            }
      
            expect(response).to have_http_status :ok
            expect(JSON.parse(response.body)).to eq ({"message"=>"Memory is recorded"})

        end
  end

  describe "POST member#comment" do

    before do
      post '/create_history', params:{
                    token: @token,
                    clan:"Clan",
                    title:"title",
                    details:"details"
            }
      post '/edit_history', params:{
                    token: @token,
                    clan:"Clan",
                    title:"title",
                    history_id:1,
                    details:"details"
            }

    end

     it 'Comment a History' do
            post '/create_comment', params:{
                    token: @token,
                    clan:"Clan",
                    edit_id: 1,
                    details:"details"
            }
      
            expect(response).to have_http_status :ok
            expect(JSON.parse(response.body)).to eq ({"message"=>"Comment is successfully stored"})

        end
  end

  describe "POST member#get_parent" do
     it 'Show Parents' do
            post '/get_parent', params:{
                    token: @token,
                    clan:"Clan"
                    
            }
      
            expect(response).to have_http_status :ok
            json_response = JSON.parse(response.body)
            expect(json_response.keys).to match_array(["family"])

        end
  end

  describe "POST member#register_person" do
     it 'Record a Person' do
            post '/register_person', params:{
                    token: @token,
                    clan:"Clan",
                    name: "name",
                    status: "status",
            }
      
            expect(response).to have_http_status :ok
            expect(JSON.parse(response.body)).to eq ({"message"=>"name is registered"})

        end
  end

  describe "POST member#register_partner" do
    before do
      post '/register_person', params:{
                    token: @token,
                    clan:"Clan",
                    name: "name",
                    status: "status",
            }
    end
     it 'Record a Partner to the person' do
            post '/register_partner', params:{
                    token: @token,
                    clan:"Clan",
                    name: "name",
                    status: "status",
                    has_children: true,
                    person_id: 1
            }
      
            expect(response).to have_http_status :ok
            expect(JSON.parse(response.body)).to eq ({"message"=>"partner is registered"})

        end
  end

  describe "POST member#ancestral_tree" do
     it 'Get family tree' do
            post '/ancestral_tree', params:{
                    token: @token,
                    clan:"Clan"
                    
            }
      
            expect(response).to have_http_status :ok
            json_response = JSON.parse(response.body)
            expect(json_response.keys).to match_array(["family"])

        end
  end

  describe "POST member#record_family_story" do
    before do
      post '/register_person', params:{
                    token: @token,
                    clan:"Clan",
                    name: "name",
                    status: "status",
            }
    end
     it 'Record a Family Story' do
            post '/family_story', params:{
                    token: @token,
                    clan:"Clan",
                    title:"title",
                    details:"details",
                    family_id: 1
            }
      
            expect(response).to have_http_status :ok
            expect(JSON.parse(response.body)).to eq ({"message"=>"Story is recorded"})

        end
  end

  describe "POST member#clan_details" do
     it 'Get Clan Details' do
            post '/clan-details', params:{
                    token: @token,
                    clan:"Clan"
                    
            }
      
            expect(response).to have_http_status :ok
            json_response = JSON.parse(response.body)
            expect(json_response.keys).to match_array(["details"])

        end
  end

end
