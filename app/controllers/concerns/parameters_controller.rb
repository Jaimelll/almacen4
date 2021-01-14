class ParametersController < ApplicationController
  

    def darcod1        
       conta=Parameter.find_by_id(1).sele
       vite= Item.where(origen:Parameter.find_by_id(1).origen,
             mmes:Parameter.find_by_id(1).mes,
             empresa:Parameter.find_by_id(1).empresa ).
             order('pfecha ASC','serie','nfactu')
                   
           
      
            if vite.count>0 and conta then    
                 vite.each do |item|
                   vite.where(id:item.id).update_all(sele:conta)
                   conta=conta+1
                 end      
            end
    end
    def darcod2    
        viten=Item.where(origen:Parameter.find_by_id(1).origen,
        empresa:Parameter.find_by_id(1).empresa).where( "mmes<?",Parameter.find_by_id(1).mes)
      
       if viten.count>0 then
           vite= viten.maximum(:sele)+1 
       else 
            vite=1
       end
           Parameter.where(id:1).update(sele:vite)   
        
     end

     def modnomb    
      case Parameter.find_by_id(1).origen
         when 1
          vnomb="Registro de Compras"
   
         when 2
          vnomb="Registro de Ventas"
      end
      return vnomb
    end




 
end
