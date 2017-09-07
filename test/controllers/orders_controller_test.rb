require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { address: @order.address, agent_paid: @order.agent_paid, apn_number: @order.apn_number, back_office_note: @order.back_office_note, city: @order.city, confirmation_recieved: @order.confirmation_recieved, county: @order.county, custom_sale_location: @order.custom_sale_location, date_recieved: @order.date_recieved, high_liability: @order.high_liability, location_id: @order.location_id, newspaper_id: @order.newspaper_id, notice_of_sale_amount: @order.notice_of_sale_amount, notice_sent: @order.notice_sent, opening_bid: @order.opening_bid, order_active: @order.order_active, post_by_date: @order.post_by_date, posting_note: @order.posting_note, posting_order_confirmed: @order.posting_order_confirmed, proof_recieved: @order.proof_recieved, publishing_date_four: @order.publishing_date_four, publishing_date_one: @order.publishing_date_one, publishing_date_three: @order.publishing_date_three, publishing_date_two: @order.publishing_date_two, publishing_instructions: @order.publishing_instructions, sale: @order.sale, sale_date: @order.sale_date, sale_information_notes: @order.sale_information_notes, sale_note: @order.sale_note, shipment_track_number: @order.shipment_track_number, shipped_to: @order.shipped_to, sold_amount: @order.sold_amount, state: @order.state, trustee_company_id: @order.trustee_company_id, trustee_sale_file_number: @order.trustee_sale_file_number, trustor: @order.trustor, zip_code: @order.zip_code }
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    patch :update, id: @order, order: { address: @order.address, agent_paid: @order.agent_paid, apn_number: @order.apn_number, back_office_note: @order.back_office_note, city: @order.city, confirmation_recieved: @order.confirmation_recieved, county: @order.county, custom_sale_location: @order.custom_sale_location, date_recieved: @order.date_recieved, high_liability: @order.high_liability, location_id: @order.location_id, newspaper_id: @order.newspaper_id, notice_of_sale_amount: @order.notice_of_sale_amount, notice_sent: @order.notice_sent, opening_bid: @order.opening_bid, order_active: @order.order_active, post_by_date: @order.post_by_date, posting_note: @order.posting_note, posting_order_confirmed: @order.posting_order_confirmed, proof_recieved: @order.proof_recieved, publishing_date_four: @order.publishing_date_four, publishing_date_one: @order.publishing_date_one, publishing_date_three: @order.publishing_date_three, publishing_date_two: @order.publishing_date_two, publishing_instructions: @order.publishing_instructions, sale: @order.sale, sale_date: @order.sale_date, sale_information_notes: @order.sale_information_notes, sale_note: @order.sale_note, shipment_track_number: @order.shipment_track_number, shipped_to: @order.shipped_to, sold_amount: @order.sold_amount, state: @order.state, trustee_company_id: @order.trustee_company_id, trustee_sale_file_number: @order.trustee_sale_file_number, trustor: @order.trustor, zip_code: @order.zip_code }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
