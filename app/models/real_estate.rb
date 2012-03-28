class RealEstate < ActiveRecord::Base
  belongs_to :possession

  def self.get_types
    types = Array.new
    types << Array['House', 'House']
    types << Array['apartment', 'apartment']
    types << Array['condominium', 'condominium']
    types << Array['townhouse', 'townhouse']
    types << Array['duplexes', 'duplexes']
    types << Array['mobile houses', 'mobile houses']
    types << Array['houseboats', 'houseboats']
    types << Array['industrial complexes', 'industrial complexes']
    types << Array['shopping centers', 'shopping centers']
    types << Array['warehouses', 'warehouses']
    types << Array['stores', 'stores']
    types << Array['garages', 'garages']
    types << Array['malls', 'malls']
  end
end
