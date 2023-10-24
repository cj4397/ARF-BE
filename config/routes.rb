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
  post '/edit_clan_history' => 'member#clan_history_edit'
  post '/edit_family_history' => 'member#family_history_edit'
  post '/edit_memory' => 'member#memory_history_edit'
  post '/edit_clan_details' => 'member#clan_detail_edit'
  post '/edits' => 'member#show_edits'
  post '/memory' => 'member#get_memories'
  post '/create_memory' => 'member#record_memory'
  post '/create_comment' => 'member#history_comment'
  post '/get_parent' => 'member#get_parent'
  post '/register_person' => 'member#register_person'
  post '/register_partner' => 'member#register_partner'
  post '/ancestral_tree' => 'member#ancestral_tree'
  post '/clan-details' => 'member#clan_details'
  post '/family_story' => 'member#record_family_story'

  post '/accept_clan_history_edit' => 'officer#accept_clan_history_edit'
  post '/accept_family_history_edit' => 'officer#accept_family_history_edit'
  post '/accept_memory_edit' => 'officer#accept_memory_edit'
  post '/edit_clan_history_edit' => 'officer#edit_clan_history_edit'
  post '/edit_memory_edit' => 'officer#edit_memory_edit'
  post '/edit_family_history_edit' => 'officer#edit_family_history_edit'


  post '/edit_clan_details_edit' => 'officer#edit_clan_details_edit'
  post '/edit_partner' => 'member#edit_partner'
  post '/edit_family' => 'member#edit_family'

  post '/delete_family' => 'member#delete_family'
  post '/delete_partner' => 'member#delete_partner'
  post '/delete_clan_history' => 'member#delete_clan_history'
  post '/delete_family_history' => 'member#delete_family_history'
  post '/delete_memory' => 'member#delete_memory'

  post '/edit_family_edit' => 'officer#edit_family_edit'
  post '/edit_partner_edit' => 'officer#edit_partner_edit'

  post '/accept_family_edit' => 'officer#accept_family_edit'
  post '/accept_partner_edit' => 'officer#accept_partner_edit'
  post '/accept_clan_details_edit' => 'officer#accept_clan_details_edit'


  post '/accept_family_delete' => 'officer#accept_family_delete'
  post '/accept_partner_delete' => 'officer#accept_partner_delete'
  post '/accept_family_history_delete' => 'officer#accept_family_history_delete'
  post '/accept_clan_history_delete' => 'officer#accept_clan_history_delete'
  post '/accept_memory_delete' => 'officer#accept_memory_delete'
  
  post '/cancel_delete_family' => 'officer#cancel_delete_family'
  post '/cancel_delete_partner' => 'officer#cancel_delete_partner'
  post '/cancel_delete_clan_history' => 'officer#cancel_delete_clan_history'
  post '/cancel_delete_family_history' => 'officer#cancel_delete_family_history'
  post '/cancel_delete_memory' => 'officer#cancel_delete_memory'

  post '/cancel_family_edit' => 'officer#cancel_family_edit'
  post '/cancel_partner_edit' => 'officer#cancel_partner_edit'
  post '/cancel_family_history_edit' => 'officer#cancel_family_history_edit'
  post '/cancel_clan_history_edit' => 'officer#cancel_clan_history_edit'
  post '/cancel_memory_edit' => 'officer#cancel_memory_edit'
  post '/cancel_clan_details_edit' => 'officer#cancel_clan_details_edit'

  
  post '/clan_details_comment' => 'member#clan_details_comment'
  post '/person_comment' => 'member#person_comment'
  post '/partner_comment' => 'member#partner_comment'
  post '/delete_person_comment' => 'member#delete_person_comment'
  post '/delete_partner_comment' => 'member#delete_partner_comment'
  post '/delete_clan_history_comment' => 'member#delete_clan_history_comment'
  post '/delete_family_history_comment' => 'member#delete_family_history_comment'
  post '/delete_memory_comment' => 'member#delete_memory_comment'

end
