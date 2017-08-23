module PropertiesHelper

  def property_visited(property)
    count1 =  $redis.sadd((current_user.id), (property.id).to_s)
  end

  def visited_property_delete(property)
    users = User.all
    users.each do |user|
      if ($redis.sismember(user.id, (property.id).to_s))
        $redis.srem(user.id, (property.id).to_s)
      end
    end
  end

end
