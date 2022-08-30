class ItemsController < ApplicationController

  def jalar(vruc,vpara)
    # IF -1
    if vruc and vruc.length>0 then
      # IF 0
    if vruc.length==11 then
      require 'json'
      require 'open-uri'
     # vruta='https://ww1.essalud.gob.pe/sisep/postulante/postulante/postulante_obtenerDatosPostulante.htm?strDni='+vadni
     vruta='https://api.sunat.cloud/ruc/'+vruc
      
     
      if  Product.find_by_id(20).precio==1
        value0= nil  
          begin 

          value0 = JSON.parse(open(vruta).read)
          rescue JSON::ParserError
            false
            Item.where(id:vpara).update_all( razon2:"no encuentra ruc",client_id:881)
          end
          value1 =value0
          puts value1
      else
        value1=false
      end
      # IF 1
      if value1 then
       Item.where(id:vpara).update_all( razon2:value1["razon_social"])
        # IF 2
       if Client.where(ruc:vruc).count==0  then
         
        object = Client.new(:ruc => vruc,
                            :razon=> value1["razon_social"],
                            :direccion => value1["domicilio_fiscal"],
                            :user_id => 3)


          object.save
       


        end
        vidclient=Client.where(ruc:vruc).select('id as dd').first.dd   
        Item.where(id:vpara).update_all(client_id:vidclient)
    #  END 2



      #  END 1
      end
      
    else

      Item.where(id:vpara).update_all( razon2:"no encuentra ruc",client_id:881)
   

# sin conexion

      #  END 0
    end  

    if  Product.find_by_id(20).precio==0

 
      # IF 2
     if Client.where(ruc:vruc).count==0  then
       
      object = Client.new(:ruc => vruc,
                          :razon=> Item.find_by_id(vpara).razon.upcase,
                          :direccion => "sin conexion",
                          :user_id => 3)
    
    
        object.save
     

      #  END 2
      end
      if Client.where(ruc:vruc).count>0 then
      vidclient=Client.where(ruc:vruc).select('id as dd').first.dd   
      Item.where(id:vpara).update_all(client_id:vidclient)
    
      Item.where(id:vpara).update_all( razon2:Item.find_by_id(vpara).razon.upcase)
      end
    
    
    
    
    
      end  # sin conexion



      #  END -1
   end   
  end#def jalar
  

  def nuevos
    compro = ItemsController.new
     
    
    

    
 cont=0
    
  Item.where(nuevo:1).where('monto IS NOT NULL').each do |ittem| 
  if cont==0 
  Parameter.where(id:1).update_all(origen:1,empresa:ittem.empresa,mes:ittem.mmes)
  cont=1
  end  

    vsub=0
    votro=0
    if ittem.isc 
      votro=votro+ittem.isc 
    end
    if ittem.bolsas 
      votro=votro+ittem.bolsas 
    end
    if ittem.oconceptos 
      votro=votro+ittem.oconceptos 
    end
    vsub=(ittem.monto-votro)/1.18


    Item.where(id:ittem.id).update_all(subtotal:vsub,nuevo:0)

     object = Detail.new(:descripcion => ittem.detalle,
                         :cantidad=> 1,
                         :item_id => ittem.id,
                         :precio => ittem.subtotal,
                         :monto =>ittem.monto,
                         :user_id => 3)

    
     
     object.save
     
     compro.jalar( ittem.ruc,ittem.id)
     
    end 


    vite1=Item.where(empresa:Parameter.find_by_id(1).empresa).
                  where( "mmes<?",Parameter.find_by_id(1).mes)

    vite2=Item.where(empresa:Parameter.find_by_id(1).empresa,
                  mmes:Parameter.find_by_id(1).mes)

    [1,2].each do |vorigen| 

    
       vsel=1
       if vite1.where(origen:vorigen).count>0 then
           vsel= vite1.where(origen:vorigen).maximum(:sele)+1 
       end
          
       

       vite=vite2.where(origen:vorigen).order('pfecha ASC','serie','nfactu')
                   
           
      
            if vite.count>0 then    
                 vite.each do |item|
                   Item.where(id:item.id).update_all(sele:vsel)
                   vsel=vsel+1
                 end      
            end

 

     end
  end







    def centr_nomb(idclient)
        vrazon='sin razon '
        vruc='sin ruc '
      if Client.where(id:idclient).count>0 then
      vrazon= Client.find_by_id(idclient).razon
      vruc=   Client.find_by_id(idclient).ruc
      end 
       return vrazon,vruc
     end
    
   

   
end
