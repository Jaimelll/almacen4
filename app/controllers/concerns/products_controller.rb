class ProductsController < ApplicationController
#1
    def peri(vid)
       vperi= Parameter.find_by_id(1).mes.strftime("%Y").to_s+
             Parameter.find_by_id(1).mes.strftime("%m").to_s+"00"
       return vperi
    end
#2
    def correl(vid)
        vcorrel=Item.find_by_id(vid).sele.to_s.rjust(5,"0")
        return vcorrel
    end
#3
    def correlm(vid)
        vcorrelm="M"+Item.find_by_id(vid).sele.to_s.rjust(5,"0")
        return vcorrelm
    end
#4
    def fechae(vid)
      vfechae=Item.find_by_id(vid).pfecha.strftime("%d/%m/%Y")
      return vfechae
    end  
#5 
    def tipc(vid)
      vtipc=if Item.find_by_id(vid).serie.first=="T" then "12" else (if Item.find_by_id(vid).serie.first=="F" then "01" else "01" end) end
        if Item.find_by_id(vid).documento==4
          vtipc="07"
        end 

      return vtipc
    end      
#6    
    def nserie(vid)
      vnserie=(if Item.find_by_id(vid).serie.first=="T" then Item.find_by_id(vid).serie else (if Item.find_by_id(vid).serie.first=="F" then Item.find_by_id(vid).serie else Item.find_by_id(vid).serie.rjust(4,"0") end) end)
      return vnserie
    end      
#7     
     def ncomp(vid)
      vncomp=Item.find_by_id(vid).nfactu.rjust(8,"0")
      return vncomp
    end 
#8     
     def tipod(vid)
      if Item.find_by_id(vid).client.id==1 
        vtipod=""
      else
         if Item.find_by_id(vid).serie.first=="B" then
          vtipod="1"
        else
          vtipod="6"
        end
      end



     return vtipod
    end
#9    
     def nruc(vid)
      vnruc=Item.find_by_id(vid).ruc
      if Item.find_by_id(vid).client.id==1 or Item.find_by_id(vid).client.id==623
        vnruc=""
      end
     return vnruc
    end
#10   
     def drazon(vid)
      vdrazon=Item.find_by_id(vid).razon2
      if Item.find_by_id(vid).client.id==1 or Item.find_by_id(vid).client.id==623
        vdrazon=""
      end
     return vdrazon
     end    
#11   
    def imponi(vid)
      
      vimponi='%.2f' % (Item.find_by_id(vid).subtotal).to_s
      if Item.find_by_id(vid).client.id==1 
        vimponi=""
      end  
    return vimponi
    end      

#12   
    def mimpuesto(vid)
      vmimpuesto='%.2f' % (Item.find_by_id(vid).subtotal*0.18).to_s
      if Item.find_by_id(vid).client.id==1 
        vmimpuesto=""
      end  
    return vmimpuesto
    end   

#13  
   def mimpote(vid)
    vmimpote='%.2f' % Item.find_by_id(vid).monto.to_s
    if Item.find_by_id(vid).client.id==1 
      vmimpote=""
    end  


   return vmimpote
   end     
#14  
   def moneda(vid)
    case Item.find_by_id(vid).moneda
    
     when 2
      vmoneda="USD"
     else
      vmoneda=""
    end
   end
#15
   def cambio(vid)
    
      vcambio=""     

      if Item.find_by_id(vid).tc 
        if  Item.find_by_id(vid).tc>0
        vcambio='%.3f' % Item.find_by_id(vid).tc.to_s 
        end
      end
      return vcambio 
   end   
   
#16
   def efecha(vid)
    vefecha=Item.find_by_id(vid).pfecha.strftime("%d/%m/%Y")
    if Item.find_by_id(vid).client.id==1 
      vefecha=""
    end  

   return vefecha
  end

  
#17
   def clasifica(vid)
    vclasifica=Item.find_by_id(vid).client.origen.to_s
   return vclasifica
  end

  
#18
    def inidicc(vid)
      vinidicc="1"
      if Item.find_by_id(vid).client.id==1 
        vinidicc=""
      end  


    return vinidicc
    end
#19
    def estadop(vid)
      if Item.find_by_id(vid).pfecha>=Item.find_by_id(vid).mmes
        vestadop="1"
      else
        vestadop="6"
      end
      if Item.find_by_id(vid).client.id==1 
        vestadop="2"
      end  

    return vestadop
    end

#20    
      def nserie2(vid)
        if Item.find_by_id(vid).documento==4
          vnserie2=(if Item.find_by_id(vid).serie2.first=="T" then Item.find_by_id(vid).serie else (if Item.find_by_id(vid).serie.first=="F" then Item.find_by_id(vid).serie else Item.find_by_id(vid).serie.rjust(4,"0") end) end)
        else
          vnserie2="" 
        end
        return vnserie2
      end      
#21    
      def ncomp2(vid)
        if Item.find_by_id(vid).documento==4
        vncomp2=Item.find_by_id(vid).ndocu2.rjust(8,"0")
       else
        vncomp2="" 
       end

        return vncomp2
      end 

#22    
      def nnum(vid)
        if Item.find_by_id(vid).documento==4
          vnnum="01" 
        else
          vnnum="" 
        end

        return vnnum
      end   


  #23   
      def visc(vid)

        visc=""

        if Item.find_by_id(vid).isc 
          if Item.find_by_id(vid).isc>0
            visc='%.3f' % Item.find_by_id(vid).isc.to_s 
          end
        end
        return visc    
    
       end     

   #24  
      def vbolsas(vid)
        vbolsas=""

        if Item.find_by_id(vid).bolsas 
          if Item.find_by_id(vid).bolsas>0
          vbolsas='%.3f' % Item.find_by_id(vid).bolsas.to_s 
          end
        end
        return vbolsas   
      end     

   #25  
      def voconceptos(vid)
        voconceptos=""

        if Item.find_by_id(vid).oconceptos
            if Item.find_by_id(vid).oconceptos>0
              voconceptos='%.3f' % Item.find_by_id(vid).oconceptos.to_s 
            end
        end
        return voconceptos   
         
      end     










      def funcx(vid,nfunc)
        case nfunc
               
         when 1
          vval=peri(vid)+"|"
         when 2
          vval=correl(vid)+"|" 
         when 3
          vval=correlm(vid)+"|"  
         when 4
          vval=fechae(vid)+"|"  
         when 5
          vval=tipc(vid)+"|"     
         when 6
          vval=nserie(vid)+"|"            
         when 7
          vval=ncomp(vid)+"|"        
         when 8
          vval=tipod(vid)+"|"    
         when 9
          vval=nruc(vid)+"|"           
         when 10
          vval=drazon(vid)+"|"     
         when 11
          vval=imponi(vid)+"|"     
         when 12
          vval=mimpuesto(vid)+"|"              
         when 13
          vval=mimpote(vid)+"|"        
         when 14
          vval=moneda(vid)+"|"   
         when 15
          vval=cambio(vid)+"|"
        when 16
          vval=efecha(vid)+"|"           
        when 17
          vval=clasifica(vid)+"|"         
        when 18
          vval=inidicc(vid)+"|"    
        when 19
          vval=estadop(vid)+"|"  
        when 20
          vval=nserie2(vid)+"|"  
        when 21
          vval=ncomp2(vid)+"|"  

        when 22
          vval=nnum(vid)+"|"  
        when 23
          vval=visc(vid)+"|"  
        when 24
          vval=vbolsas(vid)+"|"  
        when 25
          vval=voconceptos(vid)+"|"  


         else 
          vval="|"
        end
        return vval
      end

 
end
