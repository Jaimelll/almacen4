ActiveAdmin.register User do



  menu if: proc{ current_user.categoria==1 }, priority: 13,label: "Usuarios"
  permit_params :email, :password, :password_confirmation, :categoria, :empresa, :periodo

  index do
    selectable_column
    id_column
    column :email
    column :categoria
    column :empresa
  
    column :current_sign_in_at
    column :sign_in_count
   
    actions
  end

  filter :email
  filter :categoria
  filter :empresa
 

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :categoria
      f.input :empresa
    end
    f.actions
  end

end
