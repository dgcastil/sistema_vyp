require 'spec_helper'

describe "products/edit" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :code => 1,
      :name => "MyString",
      :buy_price => 1,
      :sell_price => 1
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => products_path(@product), :method => "post" do
      assert_select "input#product_code", :name => "product[code]"
      assert_select "input#product_name", :name => "product[name]"
      assert_select "input#product_buy_price", :name => "product[buy_price]"
      assert_select "input#product_sell_price", :name => "product[sell_price]"
    end
  end
end
