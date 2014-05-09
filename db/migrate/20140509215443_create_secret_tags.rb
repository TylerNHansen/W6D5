class CreateSecretTags < ActiveRecord::Migration
  def change
    create_table :secret_tags do |t|
      t.references :secret, index: true
      t.references :tag, index: true

      t.timestamps
    end
  end
end
