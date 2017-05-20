module Admin::DashboardHelper
  def pfact_data
    # pfact_by_day = PhoneFact.total_group_by_day(3.months.ago)
    (3.months.ago.to_date..Date.today).map do |date|
      {
        record_date: date,
        # ttl_callsoff: pfact_by_day[date].first.try(:ttl_callsoff) || 0
        ttl_off_calls: PhoneFact.where('date(record_date) = ?', date).sum(:calls_off)
      }
    end
  end
end
