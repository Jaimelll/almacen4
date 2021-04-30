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
          
          respond_to do |format|
            format.html
        
            format.xlsx{render template: 'reports/hoja2.xlsx.axlsx', xlsx:'tickets'}
          end
        end
       
 
 end
 