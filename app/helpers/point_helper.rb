module PointHelper
  def users_average(group_users)
    users_name =[]
    users_point =[]

    group_users.each do |group_user|
      diaries = group_user.diaries.where("date >= ? and date <= ?", @group.created_at.to_date, @group.created_at.to_date + @group_limit)
      points = diaries.average(:point)
      if points.present?
        users_name << group_user.name
        users_point << points.round(1)
      end
    end

    return users_name, users_point

  end

  def group_average(user_point)
    total_point = 0
    user_point.each do |point|
      total_point += point
    end
    total_point / gon.user_point.length rescue 0
  end
end
