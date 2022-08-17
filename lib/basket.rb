# Holds Menu instance and DishOrder instances in @list array
class Basket
  def initialize(menu, io = Kernel)
    @menu = menu
    @io = io
    @list = []
  end
  attr_accessor :menu, :io, :list

  def add(dish_name, quantity = 1)
    quantity.times { list << menu.find_dish_by_name(dish_name) }
  end

  def remove(dish_name, quantity = 1)
    quantity.times {
      list.delete_at(list.index(menu.find_dish_by_name(dish_name)) || list.length)
    }
  end
end