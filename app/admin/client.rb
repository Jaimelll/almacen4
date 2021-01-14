ActiveAdmin.register Client do

  
  
  
  
  menu priority: 4,label: "Centros"
  permit_params :ruc, :razon, :direccion,
                :obs, :tipo, :origen, :user_id







  
    filter :ruc
    filter :razon
    filter :direccion
  
  
    scope :Todos, :default => true do |clients|
      clients.all.order('razon ASC')
    end
  
    scope :proveedores do |clients|
      clients.where("tipo = 2")
    end
    scope :clientes do |clients|
      clients.where("tipo = 1")
    end
    scope :Mercaderia do |clients|
      clients.where("origen = 1")
    end
    scope :Activos do |clients|
      clients.where("origen = 2")
    end
  
    index do
      column("ruc")
      column("razon")
      column("direccion")
      column("tipo") do |clients|
        Formula.where(product_id:13).where(orden:clients.tipo).
                    select('descripcion as dd').first.dd.capitalize
      end
      column("origen") do |clients|
        Formula.where(product_id:12).where(orden:clients.origen).
                    select('descripcion as dd').first.dd.capitalize
      end
        actions
    end
  
  
  
  
    form do |f|
      f.inputs "Centros" do
        f.input :ruc, :input_html => { :style =>  'width:30%'}
        f.input :razon, :input_html => {:rows => 2, :style =>  'width:30%'}
        f.input :direccion, :input_html => {:rows => 2, :style =>  'width:30%'}
        f.input :tipo, :label => 'Tipo', :as => :select, :collection =>
                Formula.where(product_id:13).map{|u| [u.descripcion, u.orden]}
        f.input :origen, :label => 'Origen', :as => :select, :collection =>
                Formula.where(product_id:12).map{|u| [u.descripcion, u.orden]}
        f.input :user_id, :input_html => { :value => current_user.id }, :as => :hidden
  
      end
      f.actions
    end
  
  
  
    show :title => ' Centro'  do
  
  
              attributes_table do
  
                row :ruc
                row :razon
                row :direccion
                row :tipo  do |clients|
                  Formula.where(product_id:13).where(orden:clients.tipo).
                              select('descripcion as dd').first.dd.capitalize
                end
                row :origen  do |clients|
                  Formula.where(product_id:12).where(orden:clients.origen).
                              select('descripcion as dd').first.dd.capitalize
                end
                row :obs
                row :user_id do |clients|
                  clients.user.email if clients.user_id
                end
  
  
  
              end
  
          end
  
  
  
  
  
  
  
  end
  