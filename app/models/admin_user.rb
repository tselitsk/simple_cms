class AdminUser < ActiveRecord::Base

# To Configure w different table name
#	self.table_name="admin_users" 
has_and_belongs_to_many :pages

end
