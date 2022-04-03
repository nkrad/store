ActiveAdmin.register Product do
  permit_params :name, :designer, :size, :description, :price, :category_id, :image

  # exact same as demo
  form do |f| # This is a formtastic form builder.
    f.semantic_errors # shows errors on :base
    # f.inputs          # builds an input field for every attribute
    f.inputs do
      f.input :category, as: :select, collection: Category.all.map { |c| [c.category, c.id] }
      f.input :image, as: :file
      f.input :name
      f.input :designer
      f.input :size
      f.input :description
      f.input :price
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
end
