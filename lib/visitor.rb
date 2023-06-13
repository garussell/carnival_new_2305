class Visitor
  attr_reader :name,
              :height,
              :spending_money,
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


  private

  def remove_dollar_sign(value)
    value.delete('$').to_i
  end
end