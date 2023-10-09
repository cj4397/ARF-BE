class User < ApplicationRecord
    include BCrypt
     validates :first_name, presence: true
     validates :last_name, presence: true
     validates :email, presence: true, uniqueness:true
     has_many :member, dependent: :destroy
  
     has_many :user_detail
    

     after_create :generate_token

     def generate_token 
          self.token =  SecureRandom.base64[0..32]
          self.save
     end


     def password
          @password ||= Password.new(password_hash)
     end

     def password=(new_password)
          @password = Password.create(new_password)
          self.password_hash = @password
     end

     def admin
          arr = self.first_name.split('_')
          if arr.include?("admin")
               self.is_admin = true
               self.first_name= arr.first
          else
               self.is_admin = false
          end
     end

     def check?
          self.is_admin == true
     end

     def officer?
          self.position == true
     end

  
end
