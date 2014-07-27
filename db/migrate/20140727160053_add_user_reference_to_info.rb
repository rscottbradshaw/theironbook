class AddUserReferenceToInfo < ActiveRecord::Migration
  def change
    add_reference :infos, :user, index: true
  end
end
