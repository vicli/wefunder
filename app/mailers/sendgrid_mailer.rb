require 'sendgrid-ruby'
include SendGrid
require 'json'

class SendgridMailer
  def self.send(user_email, contestant, opponent,table_num)
    from = Email.new(email: 'test@example.com')
    to = Email.new(email: user_email)

    subject = 'Sending with SendGrid is Fun'
    content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
    mail = Mail.new(from, subject, to, content)
    mail.template_id = 'dc49c66f-687d-4e16-955a-097bf26fe5e9'
    personalization = Personalization.new
    personalization.add_substitution(Substitution.new(key: '-name-', value: contestant.name))
    personalization.add_substitution(Substitution.new(key: '-table_num-', value: table_num))
    personalization.add_substitution(Substitution.new(key: '-opponent-', value: opponent.name))
    mail.add_personalization(personalization)
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])

    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end
end

