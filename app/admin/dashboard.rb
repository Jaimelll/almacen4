ActiveAdmin.register_page "Dashboard" do




  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }


  content title: proc{ I18n.t("active_admin.dashboard") } do









br
strong { "Periodo:"+Parameter.find_by_id(1).mes.strftime("%b/%Y")}
br
br
case Parameter.find_by_id(1).origen
  when 1
     strong { "Registro de Compras-"}
     strong { Formula.where(product_id:10).where(orden:Parameter.find_by_id(1).empresa).
                 select('descripcion as dd').first.dd.capitalize}
     strong { link_to 'generar pdf', variables_form_path(format: :pdf)}
     br
     strong { link_to 'generar2 pdf', variables_form2_path(format: :pdf)}
  when 2
    strong { "Registro de Ventas-"}
    strong { Formula.where(product_id:10).where(orden:Parameter.find_by_id(1).empresa).
                   select('descripcion as dd').first.dd.capitalize}
  #  strong { link_to 'generar pdf', variables_form_path(format: :pdf)}
    br
    strong { link_to 'generar2 pdf', variables_form2_path(format: :pdf)}
end


br

br
strong { link_to 'ver pdf reporte2', variables_comment_path(format: :pdf)}




br
br
suss2=Item.where(origen:2,
  mmes:Parameter.find_by_id(1).mes,
  empresa:Parameter.find_by_id(1).empresa).sum(:subtotal)
suss1=Item.where(origen:1,
    mmes:Parameter.find_by_id(1).mes,
    empresa:Parameter.find_by_id(1).empresa).sum(:subtotal)

columns do

  column do


    panel "REGISTRO DE VENTAS" do
     

          
          br
          strong { "Subtotal :"+ '%.2f' %(suss2)}
          br
          strong { "IGV :"+ '%.2f' %(suss2*0.18)} 
          br
          strong { "TOTAL :"+ '%.2f' %(suss2*1.18)} 
          br

    end
  end

  column do
 
    panel "REGISTRO DE COMPRAS" do
     
       
        br
        strong { "Subtotal :"+ '%.2f' %(suss1)}
        br
        strong { "IGV :"+ '%.2f' %(suss1*0.18)} 
        br
        strong { "TOTAL :"+ '%.2f' %(suss1*1.18)} 
    br
    end
  end

 
end
suss3=suss2*0.18-suss1*0.18
if suss3>0 then
  dif="SALDO POR PAGAR="
else
  dif="CREDITO FISCAL="
end  

strong { "DIFERENCIA DE IGV VENTAS - IGV COMPRAS= "+dif+'%.2f' %(suss2*0.18-suss1*0.18)}

    # SALDO POR PAGAR Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
