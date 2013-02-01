class Challenge < ActiveRecord::Base
  belongs_to :tournament
  belongs_to :challenger, :class_name => 'User'
  belongs_to :defender, :class_name => 'User'

  before_validation :generate_expires_at

  validate :not_already_challenged

  private

  def generate_expires_at
    self.expires_at = 7.days.from_now
  end

  def not_already_challenged
    if self.class.where(:defender_id => defender_id, :tournament_id => tournament_id).length > 0
      errors.add(:defender, 'already challenged')
    end
  end
end
