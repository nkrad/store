require "test_helper"

class CheckoutControllerTest < ActionDispatch::IntegrationTest
  test "should get cart" do
    get checkout_cart_url
    assert_response :success
  end

  test "should get receipt" do
    get checkout_receipt_url
    assert_response :success
  end
end
