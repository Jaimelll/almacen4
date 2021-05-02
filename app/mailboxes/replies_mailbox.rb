class RepliesMailbox < ApplicationMailbox
  def process
    # mail
    # mail.from
    # mail.subject
    # mail.decoded Text part of the email

    return unless user.present?

    if mail.parts.present?
      Ticket.create(user: user, title: mail.subject, body: mail.parts[0].body.decoded)
    else
      Ticket.create(user: user, title: mail.subject, body: mail.decoded)
    end
    AnswerMailer.notify(user,mail,report).deliver
   
  
  end

  def report    
    repo=0
    case mail.subject.downcase[0,5]
      when "empre"
        repo=1
      when "ticke"  
        repo=2
    end
  end

  def user
    @user ||= User.find_by email: mail.from
  end
end
