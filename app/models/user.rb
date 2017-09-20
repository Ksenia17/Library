class User < ApplicationRecord

  has_many :users_roles
  has_many :roles, :through => :users_roles
  has_one  :book
  has_many :book_histories
  has_many :fines
  has_many :book_items
  has_one  :book_request

  scope :confirmed, -> { where("confirmation_time is not null") }
  scope :none_registed , -> { where("confirmation_by_admin_id is null") } 
  scope :user_yes, ->{ includes(:users_roles).where(users_roles: {role_id: Role.user_role.id}) }  #проверитьт   
  scope :administrated, -> {includes(:users_roles).where(users_roles: {role_id: Role.adm_role.id}) } 
  scope :penalized, -> { where ("penalty_time is not null")}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    validates :birthdate  ,  presence: true 
    validates :first_name ,  presence: true
    validates :last_name  ,  presence: true
#    validates :level      ,  presence: true   

 before_create :create_role
 
 def has_role?(role) # ждет на вход символ, например :admin
   # roles.include?(role)
 #  binding.pry
   roles.map{|role| role.name.to_sym }.include?(role)
  end

  private
    def create_role
      self.roles << Role.find_by_name(:user) if self.roles.blank?      
    end 
  

end
