module Admin::DashboardHelper
  def z_chart(mndate, mxdate, pfact)
    z_series = pfact.where(:record_date => mndate.beginning_of_day..mxdate.end_of_day).
      group('date(record_date)').
      select('record_date, sum(calls_off) as calls_off')
    (mndate.to_date..mxdate.to_date).map do |date|
      zfact = z_series.detect { |fact| fact.record_date.to_date == date }
      zfact && zfact.calls_off.to_f || 0
    end.inspect
  end
end
