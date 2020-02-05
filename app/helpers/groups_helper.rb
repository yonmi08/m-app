module GroupsHelper
  def average
    sum_diary = 0
    sum_point = 0

    self.users.each do |user|
      sum_diary += user.diaries.count
      user.diaries.each do |diary|
        sum_point += diary.point
      end
    end
    sum_point / sum_diary.to_f
  end
end