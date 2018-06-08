 class Cookie
        attr_reader :description, :price, :img
        
        def initialize(description, price, src)
          @description = description 
          @price = price
          @img = src
        end
     
        # this is good, but indentation is a little off.
        def self.all
            [
        new("blah blah blah", 20, 'images/double-chocolate-almond-florentines.jpg'),
        new('grhewjq', 10, 'images/chocolate.jpg'),
        new('grhewjq', 10, 'images/chocolate-chip1.jpg'),
        new('grhewjq', 10, 'images/mint-chocolate-chip-cookies.jpg')        
                
            ]

        end
 end

