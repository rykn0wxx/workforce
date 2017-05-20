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

  def self.total_group_by_day(start)
    # phone_fact = where(record_date: start.beginning_of_day..Time.zone.now)
    # phone_fact = phone_fact.group('date(record_date)')
    # phone_fact = phone_fact.select('parent_project_id, sum(calls_off) as ttl_callsoff')
    # phone_fact.group_by { |o| o.record_date.to_date }
  end
end
