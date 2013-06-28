# AttributeColumn

When Rails' form_for (or, similarly, simple_form_for) looks at a model class, it calls column_for_attribute(attr_name) for each attribute that is represented in the form.

I made this single-file module to help respond to those requests.

## Installation

    gem install attribute_column

## Usage

(I'm writing this extemporaneously, contact me if I've made mistakes or it isn't clear how this works)

    class Model
      include AttributeColumn

      def self.add_attribute(attr_name, type = :string)
        define_method attr_name do
          instance_variable_get(attr_name)
        end
        define_method "#{attr_name}=" do |new_val|
          instance_variable_set(attr_name, new_val)
        end

        attribute_column(attr_name, type)
      end

      add_attribute(:created_at, :datetime)
    end

    # Then, in a view
    = simple_form_for(Model.new) do |f|
      = f.created_at

The Rails form helpers call column_for_attribute, which wants names of attributes and their types. This helps provide that.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
