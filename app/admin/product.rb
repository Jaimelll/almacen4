ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  menu priority: 6, label: "Productos"
  
  
  ActiveAdmin.register Formula do
    belongs_to :product
  end
  
  permit_params :nombre, :descripcion, :precio,
       :moneda, :unidad, :client_id,
       :material, :lote, :proceso, :equivalente,
       :conversion, :peso, :activo, :user_id,
       :created_at, :updated_at
  
  
  
  
  
  
  
  
  scope :productos, :default => true do |products|
    products.where("proceso <> 3")
  end
  
  scope :procesos do |products|
    products.where("proceso = 3")
  end
  
  scope :todos do |products|
    products.all
  end
  
  filter :nombre
  filter :proceso
  
  
  
  index :title => 'Productos' do
    column("nombre") do |products|
       link_to "#{products.nombre} ", admin_product_formulas_path(products)
    end
  
    column("descripcion")
    column("proceso") do |products|
        if products.proceso then
            Formula.where(product_id:7).where(orden:products.proceso).
                  select('descripcion as dd').first.dd.capitalize
        end
    end
    column("precio")
  
      actions
  end
  
  
  
  form :title => 'Edicion Producto'  do |f|
  
    f.inputs  do
          f.input :nombre
          f.input :descripcion
          f.input :precio
  
          f.input :moneda, :label => 'Moneda', :as => :select, :collection =>
              Formula.where(product_id:8).map{|u| [u.descripcion, u.orden]}
          f.input :unidad, :label => 'Unidad', :as => :select, :collection =>
              Formula.where(product_id:9).map{|u| [u.descripcion, u.orden]}
  
          f.input :material
  
  
          f.input :proceso, :as => :select, :collection =>
                  Formula.where(product_id:7).map{|u| [u.descripcion,
                     u.orden]}
          f.input :conversion
          f.input :client_id, :label => 'Centro', :as => :select, :collection =>
                  Client.all.order('razon ASC').map{|u| ["#{u.razon.capitalize}---RUC#{u.ruc}", u.id]}, :input_html => { :style =>  'width:50%'}
          f.input :lote
          f.input :equivalente, :label => 'Equivalente', :as => :select, :collection =>
                  Product.all.order('nombre ASC').map{|u| [u.nombre, u.id]}
          f.input :user_id, :input_html => { :value => current_user.id }, :as => :hidden
  
        f.input :activo
    end
  
  
  
       f.actions
  
  end
  
  
  
  show :title => ' Producto'  do
  
  
  
          attributes_table do
  
  
  
            row :nombre
            row :descripcion
            row :precio
            row :moneda
            row :unidad
            row :material
            row :proceso
            row :conversion
            row :client_id
            row :lote
            row :equivalente
            row :user_id do |products|
              products.user.email if products.user_id
            end
  
          end
  
      end
  
  
  
  
  
  
  
  
  
  
  end
  