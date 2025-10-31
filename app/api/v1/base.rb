
module V1

  class Base < Grape::API

    format :json
    version 'v1', using: :path
      
    mount V1::Users
      
  end

end
