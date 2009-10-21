class WishlistsController < ApplicationController
  resource_controller
  helper :products
  
  create.before do
    @wishlist.user = current_user
  end
  
  private
  
    def object
      @object ||= end_of_association_chain.find_by_access_hash(param)
    end
  
    def can_read?
      object.can_be_read_by?(current_user) 
    end
end
