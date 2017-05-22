# == Schema Information
#
# Table name: phone_facts
#
#  id                :integer          not null, primary key
#  parent_project_id :integer
#  record_date       :date             not null
#  language_id       :integer
#  calls_off         :integer          default(0), not null
#  calls_ans         :integer          default(0), not null
#  calls_ans30       :integer          default(0), not null
#  calls_abn         :integer          default(0), not null
#  calls_abn30       :integer          default(0), not null
#  time_talk         :integer          default(0), not null
#  time_hold         :integer          default(0), not null
#  time_wrap         :integer          default(0), not null
#  queue_ans         :integer          default(0), not null
#  queue_max         :integer          default(0), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_phone_facts_on_language_id        (language_id)
#  index_phone_facts_on_parent_project_id  (parent_project_id)
#

class PhoneFact < ApplicationRecord
  belongs_to :parent_project
  belongs_to :language

  def self.items_total
    items_total = 0
    self.calls_off.each do |i|
      items_total += i.total
    end
    items_total
  end

  def self.total
    items_total * 1
  end

  def self.total_on(date)
    where("date(record_date) = ?", date).sum(:calls_off)
  end

  # def self.total_and_group_on(mindate, maxdate, grp_by)
  #   zfact = joins(:parent_project)
  #   zfact = zfact.where(record_date: mindate.to_date..maxdate.todate)
  #   zfact = zfact.select('parent_project_id, parent_projects.name as parent_project, date(phone_facts.record_date) as record_date,  sum(calls_off) as ttl_callsoff')
  #   zfact = zfact.group('parent_project_id, parent_projects.name, date(phone_facts.record_date)')
  # end
  #
  # def self.ttl_grp_day(start = 6.months.ago, grp_by = nil)
  #   # phone_fact = joins(:parent_project).where('date(record_date) = ?', start..Time.zone.now)
  #   phone_fact = joins(:parent_project)
  #   phone_fact = phone_fact.where(record_date: start.beginning_of_day..Time.zone.now)
  #   phone_fact = phone_fact.select('parent_project_id, parent_projects.name as parent_project, date(phone_facts.record_date) as record_date,  sum(calls_off) as ttl_callsoff')
  #   phone_fact = phone_fact.group('parent_project_id, parent_projects.name, date(phone_facts.record_date)')
  #   if grp_by == nil
  #     phone_fact.group_by { |o| o.record_date.to_date }
  #   else
  #     phone_fact.group_by { |o| o[grp_by].to_s }
  #   end
  # end
end
