class UserMailer < ActionMailer::Base
  default from: "tony@tonyhvac.herokuapp.com"

  def send_invoice(customer, job)
     @c = customer
     @j = job
     # I am overriding the 'to' default
     mail(to: @c.email, subject: 'You have a new invoice from TonyHVAC')
   end
end
