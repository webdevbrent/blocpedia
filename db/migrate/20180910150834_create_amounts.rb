class CreateAmounts < ActiveRecord::Migration[5.1]
  def change
    create_table :amounts do |t|

      t.timestamps
    end
  end
end
