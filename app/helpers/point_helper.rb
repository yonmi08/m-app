module PointHelper
  def point_average
    self.diaries.average(:point).round(1)
  end
end
