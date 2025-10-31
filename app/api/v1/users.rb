
module V1

  class Users < Grape::API

    resources :users do

      desc 'Listing a User'
      get do
        User.all
      end

      desc 'Showing a specific User'
      params do 
        requires :id, type: Integer, desc: 'User Id'
      end

      route_param :id do
        get do
          User.find(params[:id])
        end
        
      end

      desc 'Creating a User'
      params do 
        requires :name, type: String, desc: 'Name'
        requires :email, type: String, desc: 'Email'
        requires :username, type: String, desc: 'Username'
        requires :password, type: String, desc: 'Password'
        requires :password_confirmation, type: String, desc: 'Password Confirmation'
      end

      post do
        User.create!({
          name: params[:name],
          email: params[:email],
          username: params[:username],
          password: params[:password],
          password_confirmation: params[:password_confirmation]
        })

      end

      desc 'Updating a User'
      params do 
        requires :id, type: Integer, desc: 'User Id'
        requires :name, type: String, desc: 'Name'
        requires :email, type: String, desc: 'Email'
        requires :username, type: String, desc: 'Username'
        requires :password, type: String, desc: 'Password'
        requires :password_confirmation, type: String, desc: 'Password Confirmation'
      end

      put ':id' do 
        user = User.find(params[:id])

        user.update({
          name: params[:name],
          email: params[:email],
          username: params[:username],
          password: params[:password],
          password_confirmation: params[:password_confirmation]
        })

      end

      desc 'Deleting a User'
      params do
        requires :id, type: Integer, desc: 'User Id'
      end

      delete ':id' do
        User.find(params[:id]).destroy
      end

    end

  end

end

        
        


