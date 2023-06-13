class Visitor
  attr_accessor :spending_money
  
  attr_reader   :name,
                :height,
                :preferences

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = remove_dollar_sign(spending_money)
    @preferences = []
  end

  def add_preference(preference)
    @preferences << preference
  end

  def tall_enough?(required_height)
    height >= required_height
  end

  # helper method

  def remove_dollar_sign(value)
    value.delete('$').to_i
  end
end