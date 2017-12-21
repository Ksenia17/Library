class BookHistory < ApplicationRecord
  belongs_to :book_request #, index: { unique: true }, foreign_key: true
  belongs_to :book_item
  belongs_to :user
  has_many   :fines


	validates  :request_id  ,	presence: true
	validates  :book_item_id  ,	presence: true
	validates  :user_id  ,		presence: true
	validates  :owned_from  ,	presence: true

 
scope :on_hands, -> {where("owned_to is null")} 

  def book_return
  
    self.owned_to = Time.now
    self.save
  end

  def date_fut
  #  binding.pry      # 2 способ - history=BookHistory.find(19).owned_from.to_date + 7.day
    new_date = self.owned_from + 7.day + ( 24 - self.owned_from.hour + 1).hour # 15.hour  #self.owned_from.hour
  
  end

  

 

end
