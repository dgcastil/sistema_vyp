require 'spec_helper'

describe "products/index" do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        :code => 1,
        :name => "Name",
        :buy_price => 2,
        :sell_price => 3
      ),
      stub_model(Product,
        :code => 1,
        :name => "Name",
        :buy_price => 2,
        :sell_price => 3
      )
    ])
  end

  it "renders a list of products" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
