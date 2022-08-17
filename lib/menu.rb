class Menu
  def initialize
    @list = []
  end

  def list
    @list
  end

  def add(dish)
    list << dish
  end

  def find_dish_by_name(dish_name)
    list.find { |dish| dish.name == dish_name}
  end
end