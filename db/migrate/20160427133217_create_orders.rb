class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t| 
      t.date :date_recieved
      t.text :sale

      t.integer :posting_agent_id
      t.integer :sales_agent_id
      t.integer :trustee_sale_file_number
      t.boolean :high_liability
      t.integer :apn_number
      t.text :address
      t.text :state
      t.text :city
      t.text :county
      t.integer :zip_code
      t.date :post_by_date

      t.boolean :notice_sent
      t.boolean :confirmation_recieved
      t.boolean :proof_recieved
      t.text :publishing_instructions
      t.date :publishing_date_one
      t.date :publishing_date_two
      t.date :publishing_date_three
      t.date :publishing_date_four
      t.date :sale_date

      t.text :custom_sale_location
      t.text :trustor
      t.decimal :opening_bid_in_cents
      t.decimal :sold_amount_in_cents
      t.text :sale_information_notes
      t.text :notice_of_sale_amount
      t.integer :shipment_track_number
      t.text :shipped_to
      t.text :back_office_note
      t.text :posting_note
      t.text :sale_note
      t.boolean :posting_order_confirmed
      t.boolean :agent_paid
      t.boolean :order_active

      t.timestamps null: false
    end
  end
end
