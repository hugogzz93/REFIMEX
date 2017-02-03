class FormBuilder
  def build_form(object)
    simple_form_for object do |f|
      object.class.name.constantize.column_names.each do |d|
        f.input d.to_sym
      end
      f.button :submit
    end
  end
end