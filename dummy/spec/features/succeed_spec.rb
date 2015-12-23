require 'spec_helper'
require 'office_clerk'

describe "pay with stripe", :js => true do
  before do
    order = create :order
    page.set_rack_session order: order.id
    page.visit shop_order_path
  end
  it "works" do
    click_button I18n.t("stripe_clerk.pay_with_card")
    stripe_iframe = all('iframe[name=stripe_checkout_app]').last
    Capybara.within_frame stripe_iframe do
      fill_in "card_number", :with => '4242424242424242'
      fill_in "cc-exp", :with => '11/20'
      fill_in "cc-csc", :with => '123'
      click_button I18n.t("stripe_clerk.pay_with_card")
    end
    expect(page).to have_content(I18n.t("stripe_clerk.paid"))
  end
end
