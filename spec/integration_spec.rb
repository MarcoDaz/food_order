require 'order_confirmation'
require 'basket'
require 'basket_reader'
require 'menu'
require 'menu_reader'
require 'dish'

RSpec.describe 'Integration' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices.
  it 'can display a list of dishes with prices' do
    dish_1 = Dish.new('dish_1', 2.5)
    dish_2 = Dish.new('dish_2', 5)

    menu = Menu.new
    menu.add(dish_1)
    menu.add(dish_2)

    io = double :io
    menu_reader = MenuReader.new(menu, io)

    expect(io).to receive(:puts).with('Menu:').ordered
    expect(io).to receive(:puts).with('=' * 80).ordered
    expect(io).to receive(:puts).with('dish_1 @ £ 2.50').ordered
    expect(io).to receive(:puts).with('dish_2 @ £ 5.00').ordered

    menu_reader.display
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes.
  xit 'can add to basket' do
    dish_1 = Dish.new('dish_1', 2.5)
    dish_2 = Dish.new('dish_2', 5)

    menu = Menu.new
    menu.add(dish_1)
    menu.add(dish_2)

    basket = Basket.new(menu)
    basket.add('dish_1')
    basket.add('dish_2')

    expect(basket.list).to eq [dish_1, dish_2]
  end

  xit 'can remove from basket' do
    dish_1 = Dish.new('dish_1', 2.5)
    dish_2 = Dish.new('dish_2', 5)

    menu = Menu.new
    menu.add(dish_1)
    menu.add(dish_2)

    basket = Basket.new(menu)
    basket.add('dish_1')
    basket.add('dish_2')
    basket.remove('dish_2')

    expect(basket.list).to eq [dish_1]
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to see an itemised receipt with a grand total.
  xit 'is able to display an itemised receipt with a grand total' do
    dish_1 = Dish.new('dish_1', 2.5)
    dish_2 = Dish.new('dish_2', 5)

    menu = Menu.new
    menu.add(dish_1)
    menu.add(dish_2)

    basket = Basket.new(menu)
    basket.add('dish_1')
    basket.add('dish_1')
    basket.add('dish_2', 3)

    io = double :io
    basket_reader = BasketReader.new(basket, io)

    expect(io).to receive(:puts).with('Order').ordered
    expect(io).to receive(:puts).with('=' * 80).ordered
    expect(io).to receive(:puts).with('2 x dish_1 @ £ 2.50').ordered
    expect(io).to receive(:puts).with('3 x dish_2 @ £ 5.00').ordered
    expect(io).to receive(:puts).with('=' * 80).ordered
    expect(io).to receive(:puts).with('Total: £ 20.00').ordered

    basket_reader.receipt
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.
  xit 'is able to display an itemised receipt with a grand total' do
    dish_1 = Dish.new('dish_1', 2.5)
    dish_2 = Dish.new('dish_2', 5)

    menu = Menu.new
    menu.add(dish_1)
    menu.add(dish_2)

    basket = Basket.new(menu)
    basket.add('dish_1')
    basket.add('dish_2')
    # Check API mock bite to set current time
    # Set new time = current time + 25 mins
    # expect requester to receive message/object request
  end
end
