class AddAttachmentLogoToEstablishments < ActiveRecord::Migration
  def self.up
    change_table :establishments do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :establishments, :logo
  end
end
