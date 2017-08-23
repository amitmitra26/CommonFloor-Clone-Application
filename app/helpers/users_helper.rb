module UsersHelper
  def property_visited_load
    @properties_visited = $redis.smembers(current_user.id)
  end

  def property_visited_delete(user)
    properties = user.properties
    users = User.all
    properties.each do |p|
      users.each do |u|
        if ($redis.sismember(u.id, (p.id).to_s))
          $redis.srem(u.id, (p.id).to_s)
        end
      end
    end
    $redis.del(user.id)
  end

end
