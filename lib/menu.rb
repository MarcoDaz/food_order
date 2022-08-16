class Menu
  def initialize
    @list = []
  end

  attr_accessor :list

  def add(dish)
    list << dish
  end
end