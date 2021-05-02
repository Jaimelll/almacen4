class AnswerMailer < ApplicationMailer
    def notify(user,mmail,report)

        @user=user
        @mmail=mmail

        case report   
          when 1
            xlsx = render_to_string(layout: false,template: "reports/hoja1",
            locals: {:@vopc=> 2})  
            attachment = Base64.encode64(xlsx)
            attachments["Tickets.xlsx"] = {mime_type: Mime[:xlsx], content: attachment, encoding: 'base64'}
          when 2
            xlsx = render_to_string(layout: false,template: "reports/hoja2",
            locals: {:@vopc=> 2})  
            attachment = Base64.encode64(xlsx)
            attachments["Empresas.xlsx"] = {mime_type: Mime[:xlsx], content: attachment, encoding: 'base64'}
     
          end

        mail(to: @user.email,
             subject: 'RE:'+@mmail.subject)
     
            
     
      end
     
end
