class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each{|name| # :@name < @name is a symbol
      define_method("#{name}"){ instance_variable_get("@#{name}") }
      
      define_method("#{name}=") do |value|
        instance_variable_set("@#{name}", value)
      end # pass in dummy var
    }
  end
end
