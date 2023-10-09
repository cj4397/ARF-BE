Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/officer' => 'officer#check_officer'
  post '/admin' => 'users#admin'
  post '/get_clans' => 'users#get_clans'
  post '/sign-up' => 'users#create'
  post '/login' => 'users#signin'
  post '/branch_request' =>'users#branch_creation_request'
  post '/clan_request' =>'users#clan_creation_request'
  post '/clan_proposals' => 'users#clan_proposal'
  post '/clan_creation' => 'users#admin_clan_creation'
  post '/branch_creation' => 'users#admin_branch_creation'
  post '/clans' => 'users#show_clans'
  post '/clan_join_request' => 'users#joining_request'

  post '/officer_join_request' => 'officer#clan_join_requests'
  post '/officer_join_approval' => 'officer#accept_member'

  post '/clan_history' => 'member#get_history'
  post '/create_history' => 'member#record_history'
  post '/edit_history' => 'member#edit_history'
  post '/edits' => 'member#show_edits'
  post '/memory' => 'member#get_memories'
  post '/create_memory' => 'member#record_memory'
  post '/create_comment' => 'member#comment'
   

end
