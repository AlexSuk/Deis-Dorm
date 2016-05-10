class Quad < ActiveRecord::Base
  has_many :buildings

  def self.filter_query(args)
    values = []
    query = "building_id = ? "

    unless args[:type].nil?
      args[:type].each do |type|
				query += " AND room_type = ? "
				values.push type.downcase
      end
    end
    unless args[:price].nil?
			min = Float::INFINITY
			max = 0
      args[:price].each do |price|
				prices = price.gsub(/[$,]/, "").split("-")
				if prices[0].to_f < min
					min = prices[0].to_f
				end
				if prices[1].to_f > max
					max = prices[1].to_f
				end
      end
			query += " AND price > ? AND price < ? "
			values.push min
			values.push max
    end
    unless args[:gender].nil?
			query += " AND ( gender = ? "
			values.push gender_for_sql(args[:gender][0])
			(1...args[:gender].size).each do |g|
				query += " OR gender = ? "
				values.push gender_for_sql(args[:gender][g])
      end
			query += " ) "
    end
    unless args[:ac].nil?
      query += " AND ac = ? "
      values.push args[:ac].downcase == "true" ? true : false
    end
    unless args[:kitchen].nil?
      query += " AND kitchen = ? "
      values.push args[:kitchen].downcase == "true" ? true : false
    end
    unless args[:laundry].nil?
      query += " AND laundry = ? "
      values.push args[:laundry].downcase == "true" ? true : false
    end
    values.unshift query
    return values

  end

	def self.gender_for_sql(gender)
		if gender.downcase == "male only"
			return "male"
		elsif gender.downcase == "female only"
			return "female"
		else
			return "mixed"
		end
	end

end
