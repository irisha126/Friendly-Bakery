 class Cake
        attr_reader :description, :price, :img
        
        def initialize(description, price, src)
          @description = description 
          @price = price
          @img = src
        end
#     def self.all
#         ObjectSpace.each_object(self).to_a
#     end
    end

 cake_1 = Cake.new('dfghjk', 30, 'images/red_velvet.png')
    cake_2 = Cake.new('ghjji', 45, 'images/tiramisu1.png')
    cake_3 = Cake.new('freywsl', 12, 'images/chocolate_cake.png')
    cake_4 = Cake.new('gfdewd', 43, 'images/cheesecake.png')
    @cakes = [cake_1, cake_2, cake_3, cake_4]