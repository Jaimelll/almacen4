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
          @items = Item.where(mmes:Parameter.find_by_id(1).mes,empresa:Parameter.find_by_id(1).empresa).order('sele')
        
          
          respond_to do |format|
            format.html
        
            format.xlsx{render template: 'reports/hoja2.xlsx.axlsx', xlsx:'items'}
          end
        end
       
 
 end
 