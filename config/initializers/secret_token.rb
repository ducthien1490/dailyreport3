# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
 	token_file = Rails.root.join('.secret')
  	if File.exist?(token_file)
    	# Use the existing token.
    	File.read(token_file).chomp
  	else
    	# Generate a new token and store it in token_file.
    	token = SecureRandom.hex(64)
    	File.write(token_file, token)
    	token
  end
end

Dailyreport3::Application.config.secret_key_base = '0660f11f752110907431f8815d1c3b7ed2df2e5b807514a47d87bfa825171bc54531a1966c2abdc4afd978724abf06e9371b7cc6a0434026fc025d79d477c885'
