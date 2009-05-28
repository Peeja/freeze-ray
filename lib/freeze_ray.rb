module FreezeRay
  def attr_frozen(*attrs)
    attrs.each do |attr|
      define_method(attr) do
        super.freeze
      end
    end
  end
end
