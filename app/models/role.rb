class Role < ActiveRecord::Base
  has_many :users

  def self.is_administrator(user_id)
    if User.find(user_id).role_id == 1
      return true
    else
      return false
    end
  end

  def self.is_manager(user_id)
    if User.find(user_id).role_id == 2
        return true
      else
        return false
    end
  end

  def self.is_normal_user(user_id)
    if User.find(user_id).role_id == 3
      return true
    else
      return false
    end
  end

end
