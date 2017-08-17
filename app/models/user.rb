class User < ApplicationRecord
  
  has_many :users_roles
  has_many :roles, :through => :users_roles
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

  private
    def create_role
      self.roles << Role.find_by_name(:user) if self.roles.blank?      
    end       
end
