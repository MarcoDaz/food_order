# Food Ordering Multi-Class Design Recipe

## Describe the Problem

Put or write the user story here. Addd any clarifying notes you might have.

> As a customer <br>
> So that I can check if I want to order something <br>
> I would like to see a list of dishes with prices.

> As a customer <br>
> So that I can order the meal I want <br>
> I would like to be able to select some number of several available dishes.

> As a customer <br>
> So that I can verify that my order is correct <br>
> I would like to see an itemised receipt with a grand total.

(Using twilio-ruby gem)

> As a customer <br>
> So that I am reassured that my order will be delivered on time <br>
> I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

## Design the Method Signature

Include the name of the method, it's parameters, return value, and side effects.

```
                   ┌────────────────────────┐
                   │  OrderConfirmation     │
                   │                        │
                   │ send_sms(number)       │
                   │ is_valid(number)       │
                   │                        │
                   └───────────┬────────────┘
                               │
                               │
                               ▼
┌──────────────┐     ┌───────────────────┐      ┌───────────┐      ┌──────────────┐
│ BasketReader │     │ Basket            │      │ Menu      │      │ MenuReader   │
│              │     │                   │      │           │      │              │
│ read_basket  ├───► │ basket            ├────► │ menu      ├─────►│ read_menu    │
│              │     │ order(dish_name)  │      │ add(dish) │      │              │
│              │     │ remove(dish_name) │      │           │      │              │
└──────────────┘     │                   │      │           │      └──────────────┘
                     └───────────────────┘      └─────┬─────┘
                                                      │
                                                      │
                                                      ▼
                                                 ┌─────────┐
                                                 │  Dish   │
                                                 │         │
                                                 │  name   │
                                                 │  price  │
                                                 │         │
                                                 └─────────┘
```

```ruby
# class Credentials # Helper Class to hold private information
#     def initialize
#         @account_sid
#         @auth_token
#         @twilio_num
#     end
# end

class Interface
    def run
        # Show menu
        # Ask for order
        # Options: (1) Order more (2) Show Basket

        # Show Basket =>  Options: (1) Confirm Order (2) Show menu => Order more

        # Confirm Order => Ask for number
        # Confirm if number is valid, puts "number accepted"
    end
end

class OrderConfirmation # initialized with a Basket instance, requester, and contact number
    def initialize(basket, requester = Twilio::REST::Client)
        @basket = basket

        # store credentials for API here
        @client = requester.new account_sid, auth_token
    end

    def send_sms(number) # number is the number the text will be sent to
    
        # fails if basket is empty
        # fails if sms is invalid

        ## Send SMS confirmation:

        # @client.messages.create(
        #     from: '+14159341234',
        #     to: '+16105557069',
        #     body: 'Thank you! Your order was placed and will be delivered before 18:52'
        # )
    end

    private

    def is_valid(number)
        # return is sms valid ? true : false
    end
end


end

class BasketReader # initialized with a Basket instance
    def confirm_order
        # fails if basket is empty
        # Puts basket info in a nice formatted way
    end
end

class Basket # initialize with a Menu instance
    # holds a has of Dish instances to be ordered
    # { dish ->  }

    def basket
        # return array of Dish instances to be ordered
    end

    def add(dish_name) # dish_name is a string that matches a dish name in the menu exactly
        # fails if dish is not in menu
        # adds Dish instance to basket
    end

    def remove(dish_name) # dish_name is a string that matches a dish name in the menu exactly
        # fails if dish is not in Basket
        # remove Dish instance in basket
    end
end

class MenuReader # initialized with a Menu instance
    def confirm_order
        # fails if basket is empty
        # Puts basket info in a nice formatted way
    end
end

class Menu
    # holds an array of Dish instances

    attr_reader

    def 
end

class Dish
    def initialize(name, price)
    end

    attr_reader
end

```

## Create Examples as Integration Tests

Create examples of the classes being used together in different situations and combinations that reflect the ways in which the system will be used.


```ruby
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices.



# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes.

# As a customer
# So that I can verify that my order is correct
# I would like to see an itemised receipt with a grand total.

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

```

## Create Examples as Unit Tests

Create examples, where appropriate, of the behaviour of each relevant class at a more granular level of detail.

```ruby
# 1

```

## Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour