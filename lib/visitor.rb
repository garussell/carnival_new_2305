class Visitor
  attr_reader :name,
              :height,
              :spending_money

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = remove_dollar_sign(spending_money)
  end

  private

  def remove_dollar_sign(value)
    value.delete('$').to_i
  end

  public
end