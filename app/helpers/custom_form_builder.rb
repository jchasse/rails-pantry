class CustomFormBuilder < ActionView::Helpers::FormBuilder

  def my_fields_for(association, &block)
    association_attributes_method = "#{association}_attributes="
    object_class_downcase = @object.class.to_s.downcase
    association_attributes = "#{association}_attributes"
    object = @object
     if object.methods.include?(association.to_sym) && object.methods.include?(association_attributes_method.to_sym)
        object.send(association).each_with_index.map do |a, i|
            # binding.pry
          @object = a
          @index = i
          @object_name = "#{object_class_downcase}[#{association_attributes}][#{@index}]"
          # binding.pry
          yield(self, block)
          if @object.id
            hidden_field(:id)
          end
        end
     end.join("").html_safe
  end

end
