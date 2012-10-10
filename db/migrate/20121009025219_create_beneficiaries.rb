class CreateBeneficiaries < ActiveRecord::Migration
  def change
    create_table :beneficiaries do |t|
      t.references :vehicle
      t.references :campaign
      t.string :reason

      t.timestamps
    end
  end
end