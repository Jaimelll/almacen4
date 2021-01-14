class VariablesController < ApplicationController
  def form
    
    vruc=Formula.where(product_id:10,orden:Parameter.find_by_id(1).empresa).
       select('indicacion').map {|e| e.attributes.values}.uniq.flatten.compact
    
  case Parameter.find_by_id(1).origen

    when 1     
      
      nombre="LE" +vruc[0]+ Parameter.find_by_id(1).mes.strftime("%Y") +
          Parameter.find_by_id(1).mes.strftime("%m")+"00080100001111"
    when 2
      nombre="LE" +vruc[0]+ Parameter.find_by_id(1).mes.strftime("%Y") +
           Parameter.find_by_id(1).mes.strftime("%m")+"00140100001111"

  end
   @items = Item.where(origen:Parameter.find_by_id(1).origen,mmes:Parameter.find_by_id(1).mes,empresa:Parameter.find_by_id(1).empresa).order('pfecha ASC','serie','nfactu')
   @regis = Item.where(origen:Parameter.find_by_id(1).origen,mmes:Parameter.find_by_id(1).mes,empresa:Parameter.find_by_id(1).empresa).count('Id')
   @acum = Item.where(origen:Parameter.find_by_id(1).origen,mmes:Parameter.find_by_id(1).mes,empresa:Parameter.find_by_id(1).empresa).sum('subtotal')

   respond_to do |format|
       format.html
       format.json
       format.pdf{render template: 'variables/reporte.pdf.erb', pdf:"#{nombre}"}


     end
  end

  def form2
    
    vruc=Formula.where(product_id:10,orden:Parameter.find_by_id(1).empresa).
       select('indicacion').map {|e| e.attributes.values}.uniq.flatten.compact
    
  case Parameter.find_by_id(1).origen

    when 1     
      
      nombre="LE" +vruc[0]+ Parameter.find_by_id(1).mes.strftime("%Y") +
          Parameter.find_by_id(1).mes.strftime("%m")+"00080100001111"
    when 2
      nombre="LE" +vruc[0]+ Parameter.find_by_id(1).mes.strftime("%Y") +
           Parameter.find_by_id(1).mes.strftime("%m")+"00140100001111"

  end
   @items = Item.where(origen:Parameter.find_by_id(1).origen,mmes:Parameter.find_by_id(1).mes,empresa:Parameter.find_by_id(1).empresa).order('pfecha ASC','serie','nfactu')
   @regis = Item.where(origen:Parameter.find_by_id(1).origen,mmes:Parameter.find_by_id(1).mes,empresa:Parameter.find_by_id(1).empresa).count('Id')
   @acum = Item.where(origen:Parameter.find_by_id(1).origen,mmes:Parameter.find_by_id(1).mes,empresa:Parameter.find_by_id(1).empresa).sum('subtotal')

   respond_to do |format|
       format.html
       format.json
       format.pdf{render template: 'variables/reporte3.pdf.erb', pdf:"#{nombre}"}


     end
  end





  def comment

   @items = Item.where(origen:Parameter.find_by_id(1).origen,mmes:Parameter.find_by_id(1).mes,empresa:Parameter.find_by_id(1).empresa).order('pfecha ASC','serie','nfactu')
   @regis = Item.where(origen:Parameter.find_by_id(1).origen,mmes:Parameter.find_by_id(1).mes,empresa:Parameter.find_by_id(1).empresa).count('Id')
   @acum = Item.where(origen:Parameter.find_by_id(1).origen,mmes:Parameter.find_by_id(1).mes,empresa:Parameter.find_by_id(1).empresa).sum('subtotal')
   respond_to do |format|
       format.html
       format.json
       format.pdf{render template: 'variables/reporte2.pdf.erb', pdf:'Factura2'}
     end
  end

end
