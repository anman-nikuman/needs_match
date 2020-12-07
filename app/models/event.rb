class Event < ApplicationRecord
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      event = new
      delete_list = ["都道府県", "支部名", "星", "主催", "c-sh", "幹事", "c-ka", "事務局長", "c-ji"]
      event_key = [["郵便番号", "postal_code"], ["c-pr", "prefecture_code"], ["最寄駅1", "station1"], ["最寄駅2", "station2"], ["会場住所", "address"]]
      event_hash = row.to_h
      event_hash_time = event_hash["時間"].split(":")
      
      lr_dt = Event.dt_select
      lr_first_week_year = lr_dt.beginning_of_month.cweek
      lr_this_week_year = lr_dt.cweek
      lr_this_week_month = lr_this_week_year - lr_first_week_year + 1

      if event_hash["開催週"].to_i < lr_this_week_month
        lr_dt = lr_dt.next_month
      end

      sm_dt = lr_dt.beginning_of_month
      first_week_days = 7 - sm_dt.wday
      day = first_week_days + (7 * (event_hash["開催週"].to_i - 2)) + event_hash["c-we"].to_i + 1
      event_date = lr_dt
      event_date = event_date.change(day: day, wday: event_hash["c-we"].to_i, hour: event_hash_time[0].to_i, min: event_hash_time[1].to_i)

      event_hash.delete_if {|k, v|
        delete_list.include?(k)
      }

      event_hash_db = event_key.map {|x| [ x[1], event_hash[x[0]] ]}.to_h
      event_hash_db["date"] = event_date
      event_hash_db["branch_id"] = Branch.find_by(name: row.to_h["支部名"]).id

      event.attributes = event_hash_db.to_h.slice(*updatable_event_attributes)

      p event
      event.save
    end
  end

  def self.dt_select
    if self.exists?
      return self.last.date.to_datetime
    else
      return DateTime.new(2020, 12, 1, 0, 0, 0, 0 )
    end
  end

  def self.updatable_event_attributes
    ["branch_id", "date", "station1", "station2", "postal_code", "prefecture_code", "address"]
  end
end
