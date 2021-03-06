ActiveAdmin.register User do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at

  permit_params :email
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # exact same as demo
  form do |f| # This is a formtastic form builder.
    f.semantic_errors # shows errors on :base
    # f.inputs          # builds an input field for every attribute
    f.inputs do
      f.input :email
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
end
