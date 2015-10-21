class AddProfileImageToDefinitions < ActiveRecord::Migration
  def change
    add_column :definitions, :profile_image_id, :string
  end
end
