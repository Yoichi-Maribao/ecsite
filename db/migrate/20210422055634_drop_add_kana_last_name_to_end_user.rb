class DropAddKanaLastNameToEndUser < ActiveRecord::Migration[5.2]
  def change
    drop_table :add_kana_last_name_to_end_users
  end
end
