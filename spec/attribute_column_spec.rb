require_relative 'minitest_helper'

describe AttributeColumn do
  [:binary, :boolean, :date, :datetime, :decimal, :float, :integer,
    :primary_key, :string, :text, :time, :timestamp].each do |type|
    it "should respond to all ActiveRecord type #{type}" do
      AttributeColumn.generate({type: type}).must_be_kind_of AttributeColumn::Attribute
    end
  end

  it "should have 255 limit when string" do
    AttributeColumn.generate({type: :string}).limit.must_equal 255
  end

  [:float, :integer].each do |type|
    it "should be number? true when #{type}" do
      AttributeColumn.generate({type: type}).number?.must_equal true
    end
  end

  describe "applied to class" do
    let(:columned_class) do
      Class.new do
        include AttributeColumn
      end
    end
    let(:columned) { columned_class.new }

    it "should have a columns_hash" do
      columned_class.columns_hash.must_be_kind_of Hash
    end

    it "should store (and retrieve) a column type" do
      columned_class.attribute_column(:title, :string)
      columned.column_for_attribute(:title).type.must_equal :string
    end

    it "should be tollerant of string/sybol mismatches" do
      columned_class.attribute_column(:b, :binary)
      columned_class.attribute_column("d", :date)

      columned.column_for_attribute("b").type.must_equal :binary
      columned.column_for_attribute(:d).type.must_equal :date
    end
  end
end
