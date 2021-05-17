class Mock_Pizzas_Consumptions
  @@response = []

  def self.group_by_eaten_at
    self
  end

  def self.order_by_count
    self
  end

  def self.order_by_eaten_at
    self
  end

  def self.filter_by_month(month)
    self
  end

  def self.filter_by_year(year)
    self
  end

  def self.mockResponse(array_of_hashes)
    @@response = array_of_hashes
  end

  def self.naked
    @@response
  end
end