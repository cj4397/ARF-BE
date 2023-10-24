require 'rails_helper'

RSpec.describe "Users", type: :request do


  describe "Post users#create" do
   
      it 'creates new admin user' do
          post '/sign-up', params: {
            user:{
                  first_name:"Admin_admin",
                  middle_name:"middle",
                  last_name:"last",
                  email:"email@email.com",
                  password:"password"
              }
          }
        expect(response).to have_http_status :ok
        json_response = JSON.parse(response.body)
        expect(json_response.keys).to match_array(["admin","user", "token"])
      end
  end

  describe "POST /login" do 
      before do
       User.create(
        first_name: "Admin_admin",
        middle_name: "middle",
        last_name: "last",
        email: "email@email.com",
        password: "password"
        )
      end

      it 'sign in user' do
         post '/login', params: {
                email: "email@email.com",
                password: "password"
        }

          expect(response).to have_http_status :ok
          json_response = JSON.parse(response.body)
          expect(json_response.keys).to match_array(["user", "token"])
      end
  
  end

end
