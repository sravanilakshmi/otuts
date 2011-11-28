class CreateUserSpecs < ActiveRecord::Migration
  def change
    create_table :user_specs do |t|

      t.timestamps
    end
  end
end
