module RolePlayer
  extend ActiveSupport::Concern

  def roles=(roles)
    self.roles_mask = (roles & User::ROLES).map { |r| 2**User::ROLES.index(r) }.inject(0, :+)
  end

  def roles
    User::ROLES.reject do |r|
      ((roles_mask || 0) & 2**User::ROLES.index(r)).zero?
    end
  end

  def is?(role)
    roles.include?(role.to_s)
  end
end
