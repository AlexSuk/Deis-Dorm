class Quad < ActiveRecord::Base
  has_many :buildings

  def self.filter_query(args)
    values = []
    query = "building_id = ? "

    unless args[:type].nil?
      args[:type].each do |type|

      end
    end
    unless args[:price].nil?
      args[:price].each do |type|

      end
    end
    unless args[:gender].nil?
      args[:gender].each do |type|

      end
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

end
