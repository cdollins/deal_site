class AddMapToImport < ActiveRecord::Migration
  def change
    add_column :imports, :field_transforms, :string

    add_column :imports, :header_transforms, :string

    add_column :imports, :header_parse_regex, :string

    add_column :imports, :field_parse_regex, :string
    
    remove_column :imports, :import_map
  end
end
