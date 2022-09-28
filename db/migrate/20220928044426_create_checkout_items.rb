class CreateCheckoutItems < ActiveRecord::Migration[7.0]
  def change
    create_table :checkout_items do |t|
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
