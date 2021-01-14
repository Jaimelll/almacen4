class ReportsController < ApplicationController

  
 
     def vhoja1
       @vopc=params[:param1]
      # sin parametros
        respond_to do |format|
          format.html
      
          format.xlsx{render template: 'reports/hoja1.xlsx.axlsx', xlsx:'partes'}
        end
      end
       
 
 end
 