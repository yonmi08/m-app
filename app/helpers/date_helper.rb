module DateHelper
  def date_calc(start)
    progress = Date.today - start.to_date
    limit = 7

    if limit < progress
      @group.flag = 1
      @group.save
    end

    return progress, limit
  end
end