class AnswerMailer < ApplicationMailer
    def notify(user,mmail,report)

        @user=user
        @mmail=mmail
        @report=report

        case @report   
          when 1
            xlsx = render_to_string(layout: false,template: "reports/hoja1",
            locals: {:@vopc=> 2})  
            attachment = Base64.encode64(xlsx)
            attachments["Empresas.xlsx"] = {mime_type: Mime[:xlsx], content: attachment, encoding: 'base64'}
          when 2
            items = Item.where(mmes:Parameter.find_by_id(1).mes,empresa:Parameter.find_by_id(1).empresa).order('sele')
            xlsx = render_to_string(layout: false,template: "reports/hoja2",
            locals: {:@vopc=> 2, :@items=> items})  
            attachment = Base64.encode64(xlsx)
            attachments["Sunat.xlsx"] = {mime_type: Mime[:xlsx], content: attachment, encoding: 'base64'}
          else
            @report=0
          end

        mail(to: @user.email,
             subject: 'RE:'+@mmail.subject)
     
            
     
      end
     
end
