class MenuReader
  def initialize(menu, io = Kernel)
    @menu = menu
    @io = io
  end

  attr_accessor :menu, :io

  def display
    io.puts "Menu"
    io.puts "=" * 80
    menu.list
      .map { |dish| "#{dish.name} @ £ #{format('%.2f', dish.price)}" }
      .each { |dish_string| io.puts dish_string }
  end
end