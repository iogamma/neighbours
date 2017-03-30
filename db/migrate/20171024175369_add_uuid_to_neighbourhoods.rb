class AddUuidToNeighbourhoods < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    add_column :neighbourhoods, :uuid, :uuid, default: "gen_random_uuid()"
  end
end
