class ReportsController < ApplicationController

  
 
     def vhoja1
     @vopc =params[:@param1]
       
        respond_to do |format|
          format.html
      
          format.xlsx{render template: 'reports/hoja1.xlsx.axlsx', xlsx:'partes'}
        end
      end

      def vhoja2
          @vopc=params[:@param1]
          @items = Item.where(origen:Parameter.find_by_id(1).origen,mmes:Parameter.find_by_id(1).mes,empresa:Parameter.find_by_id(1).empresa).order('pfecha ASC','serie','nfactu')
          @regis = Item.where(origen:Parameter.find_by_id(1).origen,mmes:Parameter.find_by_id(1).mes,empresa:Parameter.find_by_id(1).empresa).count('Id')
          @acum = Item.where(origen:Parameter.find_by_id(1).origen,mmes:Parameter.find_by_id(1).mes,empresa:Parameter.find_by_id(1).empresa).sum('subtotal')
       
          
          respond_to do |format|
            format.html
        
            format.xlsx{render template: 'reports/hoja2.xlsx.axlsx', xlsx:'tickets'}
          end
        end
       
 
 end
 