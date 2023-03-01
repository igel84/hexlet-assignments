# frozen_string_literal: true

# BEGIN
module Model
  module ClassMethods
    def attribute(name, *attr)
            
      define_method "#{name}" do
        value = instance_variable_get "@#{name}"

        # value = attr.last[:default] if value.nil?
        return nil if value.nil?

        case attr.first[:type]
          when :integer then value.to_i
          when :string then value.to_s
          when :datetime then DateTime.parse(value)
          else value
        end
      end
      
      define_method "#{name}=" do |value|
        # value = attr.first[:default] if value.nil?
        
        # attr.last[:default] = value if value.nil?
        instance_variable_set("@#{name}", value)
      end

      # pp send(:instance_variable_set, "@#{name}", attr.first[:default])
    end
  end
  
  def initialize(attr = {})
    attr.keys.each do |key|
      # instance_variable_set "@#{key}", attr[key]
      instance_variable_set "@#{key}", attr[key]
    end
  end

  def attributes
    instance_variables.reduce({}) { |attr, var| var = var[1..]; attr[var.to_sym] = send(var); attr }
  end

  def self.included(base)
    base.extend(ClassMethods)
  end
end
# END
