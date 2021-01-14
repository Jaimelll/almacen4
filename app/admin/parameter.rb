ActiveAdmin.register Parameter do

  actions :all, except: [:destroy, :new]

  permit_params :empresa, :origen,:mes,
                :sele, :sele1, :sele2, :sele3

  member_action :compra, method: :put do
    @num=Parameter.where( id:1 ).
         select('origen as dd').first.dd

      Parameter.where( id:1 ).update_all( origen:1 )
        redirect_to admin_items_path
    end


  member_action :venta, method: :put do
    @num=Parameter.where( id:1 ).
         select('origen as dd').first.dd

      Parameter.where( id:1 ).update_all( origen:2 )
        redirect_to admin_items_path
    end


    member_action :darcod, method: :put do

      dar = ParametersController.new   
      dar.darcod1
      redirect_to admin_items_path  
      
    end

  #   member_action :darcodini, method: :put do
  #     redirect_to admin_parameters_path
  #   end

  #    action_item :only=> :index do
  #     link_to 'Dar codigo inicial', darcodini_admin_parameter_path(1), method: :put
  #    end

 # config.clear_action_items!

menu priority: 6, label: "Parametros"
filter :mes

index :title => 'Parametros' do


    column("empresa")do |para|
     Formula.where(product_id:10,orden:para.empresa).
                select('descripcion as dd').first.dd
    end

    column("origen")do |para|
              Formula.where(product_id:11,orden:para.origen).
                select('descripcion as dd').first.dd
    end


    column("mes")
    column("Codigo Inicial", :sele)
       actions
    end

    form :title => 'Edicion Parametro'  do |f|

        f.inputs  do



           f.input :empresa , :as => :select, :collection =>
               Formula.where(product_id:10).map{|u| [u.descripcion, u.orden]}
           f.input :origen, :as => :select, :collection =>
               Formula.where(product_id:11).map{|u| [u.descripcion, u.orden]}
            
            f.input :mes, as: :datepicker, :input_html => { :style =>  'width:30%'}
      #      f.input :sele, :label => 'Codigo inicial', :input_html => { :rows => 2,:style =>  'width:30%'}
            f.actions
        end
      end




      show :title => ' Parametro'  do
        dar = ParametersController.new   
        dar.darcod2


              attributes_table do

      

                row :empresa do |para|

                           Formula.where(product_id:10,orden:para.empresa).
                            select('descripcion as dd').first.dd
                end
                row :origen do |para|
                          Formula.where(product_id:11,orden:para.origen).
                            select('descripcion as dd').first.dd
                end

                row :mes
#                 row :CodigoInical do |para|
#                      para.sele
 #                end

                row 'modificado' do |clients|
                  clients.updated_at.to_s
                end


          end

      end








end
