class AnswerMailer < ApplicationMailer
    def notify(user,mmail)

        @user=user
        @mmail=mmail

        xlsx = render_to_string layout: false, template: "reports/hoja1", locals: {param1: 2}      


        attachment = Base64.encode64(xlsx)
        attachments["empresas.xlsx"] = {mime_type: Mime[:xlsx], content: attachment, encoding: 'base64'}
     
       
        mail(to: @user.email,
             subject: 'RE:'+@mmail.subject)
     
            
     
      end
     
end
