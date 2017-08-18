class UserMailer < ApplicationMailer
  default from: 'notifications@commonfloorclone.com'
  def property_visited(property,user)
    @property = property
    @user = user
    @url  = 'http://example.com/login'
    mail(to: property.user.email, subject: 'Your Property is visited' )
end
def property_interested(property,user)
  @property = property
  @user = user
  @url  = 'http://example.com/login'
  mail(to: property.user.email, subject: 'Your Property is Marked Interested' )
end
end
