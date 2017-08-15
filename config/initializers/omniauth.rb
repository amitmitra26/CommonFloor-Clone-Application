Rails.application.config.middleware.use OmniAuth::Builder do
	#provider :twitter, '', ''
	provider :facebook, '262869790879841', '8c5392918d331fbe1ae53118d2d09fb0'

end
