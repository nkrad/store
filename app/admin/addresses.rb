ActiveAdmin.register Address do
  permit_params :fname, :lname, :street, :city, :postalcode, :province_id, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:fname, :lname, :street, :city, :postalcode, :province_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # exact same as demo
  form do |f| # This is a formtastic form builder.
    f.semantic_errors # shows errors on :base
    # f.inputs          # builds an input field for every attribute
    f.inputs do
      f.input :fname
      f.input :lname
      f.input :street
      f.input :city
      f.input :postalcode
      f.input :province_id, as: :select, collection: Province.all.map { |c| [c.province, c.id] }
      f.input :user_id, as: :select, collection: User.all.map { |c| [c.email, c.id] }
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
end
