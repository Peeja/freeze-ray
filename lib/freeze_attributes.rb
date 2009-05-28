module FreezeAttributes
  def freeze_attributes(*attrs)
    attrs.each do |attr|
      define_method(attr) do
        super.freeze
      end
    end
  end
end
