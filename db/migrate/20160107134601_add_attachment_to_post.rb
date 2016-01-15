class AddAttachmentToPost < ActiveRecord::Migration
  def change
    add_attachment :posts, :avatar
  end
end
