class Profile < ActiveRecord::Base
  has_many :users
  has_many :profile_functionalities
  has_many :functionalities, through: :profile_functionalities
  belongs_to :manager
  belongs_to :agent

  #
  def validate_functionality
    if self.functionalities.any?{|f| all_functionalities.exclude?(f) }
      self.errors.add(:base, "Não pode criar funcionalidades")
    end
  end

end
