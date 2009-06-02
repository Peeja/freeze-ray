module FreezeRay
  def attr_frozen(*attrs)
    include Module.new {
      attrs.each do |attr|
        define_method(attr) do
          super.freeze
        end
      end
    }
  end
end
