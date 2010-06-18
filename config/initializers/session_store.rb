# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_blogdocs_session',
  :secret      => '2871423f14f07eb03dcbff7b3902c6bcb549ec79dbf17d580919160bf7c996880fe1a6ba4f103b5d680d66dfdc2759f9b3a119d5a440f3d5624a65cd4c550ffe'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
