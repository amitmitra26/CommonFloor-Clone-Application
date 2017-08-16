OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	#provider :twitter, '', ''
	provider :facebook, '262869790879841', '8c5392918d331fbe1ae53118d2d09fb0'
	provider :google_oauth2, '946131730353-dii5phejo111ffgr0okb30ii54eg3iof.apps.googleusercontent.com', 'kXwB5bk2rI6OhULRnwpoRo9E', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}

end
