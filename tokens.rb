# require 'jwt'
# require 'openssl'

# private_key = OpenSSL::PKey::RSA.generate(2048)
# public_key = private_key.public_key

# def invite(private_key)
#   payload = {
#     "iss": "myapp1",
#     "sub": "invitation",
#     "jti": "inv1",
#     "aud": "abc@gmail.com",
#     "iat": Time.now.to_i,
#     "exp": Time.now.to_i + 5 * 3600
#   }

#   token = JWT.encode(payload, private_key, 'RS256')

#   puts "Encoded Invite Token: #{token}"

#   decoded_token = JWT.decode(token, private_key, true, {algorithm: 'RS256'})

#   puts "Decoded Invite Token: #{decoded_token}"
# end

# def confirm(private_key)
#   payload= {
#     "iss": "myapp1",
#     "sub": "confirm",
#     "aud": "abc@gmail.com",
#     "jti": "cnf1",
#     "iat": Time.now.to_i,
#     "exp": Time.now.to_i + 24*3600 
#   }

#   token = JWT.encode(payload, private_key, 'RS256')

#   puts "Encoded Confirm Token: #{token}"

#   decoded_token = JWT.decode(token, private_key, true, {algorithm: 'RS256'})

#   puts "Decoded Confirm Token: #{decoded_token}"

# end

# def session(private_key)
#   payload = {
#     "sub": "session"
#     "iss": "myapp1",
#     "user_id": "abc@gmail.com",
#     "jti": "sess1",
#     "iat": Time.now.to_i,
#     "exp": Time.now.to_i + 24*3600
#   }

#   token = JWT.encode(payload, private_key, 'RS256')

#   puts "Encoded Session Token: #{token}"

#   decoded_token = JWT.decode(token, private_key, true, {algorithm: 'RS256'})

#   puts "Decoded Session Token: #{decoded_token}"

# end


# def password_reset(private_key)

# end


# puts "------ Invitation Token ------ "
# invite(private_key)

# puts "------ Confirmation Token ------ "
# confirm(private_key)

# puts "------ Session Token ------ "
# session(private_key)



