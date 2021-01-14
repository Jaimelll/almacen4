ActiveAdmin.register Formula do




  permit_params :product_id, :material, :cantidad,
        :user_id, :created_at, :updated_at,
          :descripcion, :indicacion, :orden
  
  
    
  
   
  
  
  
  
  
  
  
  
  filter :descripcion
  
  
          index do
                column("descripcion") do |formula|
                  link_to "#{formula.descripcion}", admin_products_path()
                end
  
                column("material") do |formula|
                  if formula.material then
                     Product.where(id:formula.material).select('nombre as dd').first.dd.to_s
                  end
                end
  
  
                column("cantidad")
                column("orden")
  
                column("RUC") do |formula|
                 formula.indicacion
                end
  
                  actions
              end
  
  
  
  
            form do |f|
  
              nn=Product.where(id:params[:product_id]).
                         select('nombre as dd').first.dd.capitalize
               f.inputs "#{nn}" do
  
  
                 f.input :material, :label => 'Material', :as => :select, :collection =>
                               Product.all.order('nombre ASC').map{|u| [u.nombre, u.id]}
                 f.input :descripcion, :input_html => { :style =>  'width:30%'}
                 f.input :indicacion, :label => 'RUC', :input_html => { :style =>  'width:30%'}
  
                 f.input :cantidad,:as =>:string
                 f.input :orden, :input_html => { :style =>  'width:30%'}
                 f.input :user_id, :input_html => { :value => current_user.id }, :as => :hidden
  
                 end
                f.actions
  
  
          end
  
          show do
  
  
                    attributes_table do
  
                      nn=Product.where(id:params[:product_id]).
                               select('nombre as dd').first.dd.capitalize
  
                      row :product_id do |formula|
                        link_to "#{nn}", admin_product_formulas_path(formula.product_id)
                      end
                      row :material do |formula|
                        if formula.material then
                           Product.where(id:formula.material).select('nombre as dd').first.dd.to_s
                        end
                      end
                      row :descripcion
                      row "RUC" do |formula|
                        formula.indicacion
                       end
                      row :cantidad
                      row :orden
                      row :user_id do |formula|
                        formula.user.email if formula.user_id
                      end
  
  
                    end
  
                end
  
  
                sidebar "Productos" do
                  nn=Product.where(id:params[:product_id]).
                           select('nombre as dd').first.dd.capitalize
  
                        ul do
                          li   link_to "#{nn}", admin_products_path
                          li
                          li  link_to "Docs x empresa",reports_vhoja1_path(format:  "xlsx", :param1=> 2)
                          li
                          li  "CUIDADO CON ELIMINAR "
                          li  link_to "Elimina Confecciones",reports_vhoja1_path(format:  "xlsx", :param1=> 3)
                        end
  
  
  
                      end # de sider
  
  
  
  
  
  
  
  
  end
  