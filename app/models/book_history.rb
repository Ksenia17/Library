class BookHistory < ApplicationRecord
  belongs_to :book_request #, index: { unique: true }, foreign_key: true
  belongs_to :book_item
  belongs_to :user
  has_many   :fines


	validates  :request_id  ,	presence: true
	validates  :book_item_id  ,	presence: true
	validates  :user_id  ,		presence: true
	validates  :owned_from  ,	presence: true

 default_scope {where("owned_to is null")} 

# scope :on_hands, -> {where("owned_to is null")} 

  def book_return
  
    self.owned_to = Time.now
    self.save
  end

  

 

end
