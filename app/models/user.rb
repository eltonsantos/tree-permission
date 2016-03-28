class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :manager
  belongs_to :agent
  belongs_to :profile

  belongs_to :father, class_name: "User"

  def manager?
    !self.manager_id.blank? && self.agent_id.blank? && self.admin == false
  end

  def agent?
    !self.manager_id.blank? && !self.agent_id.blank? && self.admin == false
  end

  def active_for_authentication?
    super && active
  end

end
