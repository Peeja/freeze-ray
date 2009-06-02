module FreezeRay
  def attr_frozen(*attrs)
    attrs.each do |attr|
      old_getter = instance_method(attr)
      define_method(attr) do
        old_getter.bind(self).call.freeze
      end
    end
  end
end
