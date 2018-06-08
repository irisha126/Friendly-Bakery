require 'sinatra'
require './cookie_class'
require './cake_class'
require './muffin_class'
require 'mailgun'

our_cookies=[]
our_cakes=[]
our_muffins=[]

get ('/') do
    erb(:index)
end

get ('/cookies') do
    cookie_1 = Cookie.new("Double Chocolate Almond Florentines", 20, 'images/double-chocolate-almond-florentines.jpg')
    cookie_2 = Cookie.new('Chocolate Cookie', 10, 'images/chocolate.jpg')
    cookie_3 = Cookie.new('Chocolate Chip Cookie', 10, 'images/chocolate-chip1.jpg')
    cookie_4 = Cookie.new('Mint Chocolate Chip Cookies', 10, 'images/mint-chocolate-chip-cookies.jpg')
    
    # good job using the array you don't need the variable "our_cookies"
    # our_cookies = [cookie_1, cookie_2, cookie_3, cookie_4 ] 
    @cookies = [cookie_1, cookie_2, cookie_3, cookie_4 ] 

    erb(:cookies)
end

get ('/cakes') do
    
    cake_1 = Cake.new('Red Velvet Cake', 30, 'images/red_velvet.png')
    cake_2 = Cake.new('Tiramisu Cake', 45, 'images/tiramisu1.png')
    cake_3 = Cake.new('Chocolate Cake', 35, 'images/chocolate_cake.png')
    cake_4 = Cake.new('Cheesecake', 43, 'images/cheesecake.png')

    # you don't need these intermediate variable
    # our_cakes = [cake_1, cake_2, cake_3, cake_4]
    @cakes = [cake_1, cake_2, cake_3, cake_4]
 
    erb(:cakes)
end

get ('/muffins') do
    muffin_1 = Muffin.new('Blueberry Muffin', 4, 'images/blueberry.jpg')
    muffin_2 = Muffin.new('Favorite Banana Chip Muffin', 5, 'images/Favorite-Banana-Chip.jpg')
    muffin_3 = Muffin.new('Pumpkin Apple Muffin', 45, 'images/Pumpkin-Apple-Muffin.jpg')
    muffin_4 = Muffin.new('Cinnamon Muffin', 4, 'images/cinnamon.jpg')
    # our_muffins = [muffin_1, muffin_2, muffin_3, muffin_4]
    @muffins = [muffin_1, muffin_2, muffin_3, muffin_4]
    
    erb(:muffins)
end
 
get ('/form') do
    erb(:form)
end

post ('/submition') do
    @email = params[:email]
    @l_name = params[:l_name]
    @f_name = params[:f_name]
    @cookies=our_cookies
    mg_client = Mailgun::Client.new(
        ENV['MAILBOX_API_KEY'],
        'api.mailgun.net',
        'v3',
        false,
        false
        )
    
    # this looks like it was duplicated from above...can you think of a better way of doing this?
    cookie_1 = Cookie.new("blah blah blah", 20, 'images/double-chocolate-almond-florentines.jpg')
    cookie_2 = Cookie.new('grhewjq', 10, 'images/chocolate.jpg')
    cookie_3 = Cookie.new('grhewjq', 10, 'images/chocolate-chip1.jpg')
    cookie_4 = Cookie.new('grhewjq', 10, 'images/mint-chocolate-chip-cookies.jpg')
    our_cookies = [cookie_1, cookie_2, cookie_3, cookie_4 ] 
    @cookies=our_cookies
    
    
    # this looks like it was duplicated from above...can you think of a better way of doing this?
    cake_1 = Cake.new('Red Velvet Cake', 30, 'images/red_velvet.png')
    cake_2 = Cake.new('Tiramisu Cake', 45, 'images/tiramisu1.png')
    cake_3 = Cake.new('Chocolate Cake', 35, 'images/chocolate_cake.png')
    cake_4 = Cake.new('Cheesecake', 43, 'images/cheesecake.png')
    our_cakes = [cake_1, cake_2, cake_3, cake_4]
    @cakes=our_cakes
    
    # this looks like it was duplicated from above...can you think of a better way of doing this?
    muffin_1 = Muffin.new('Blueberry Muffin', 4, 'images/blueberry.jpg')
    muffin_2 = Muffin.new('Favorite Banana Chip Muffin', 5, 'images/Favorite-Banana-Chip.jpg')
    muffin_3 = Muffin.new('Pumpkin Apple Muffin', 45, 'images/Pumpkin-Apple-Muffin.jpg')
    muffin_4 = Muffin.new('Cinnamon Muffin', 4, 'images/cinnamon.jpg')
    our_muffins = [muffin_1, muffin_2, muffin_3, muffin_4]
    @muffins=our_muffins
    
 
    
    
    message_params =  { from: 'irynazerkal@gmail.com',
                        to: @email,
                        subject: 'Catalog',
                        html: erb(:email_template, layout: false)
                      }
    
    begin
        mg_client.send_message(ENV['MAILBOX_API_DOMAIN'], message_params)
    rescue 
        return redirect('/500')
    end

    redirect('/') 
end

get ('/500') do
    # nice!!!
    # but indentation is a little off.
  erb(:error, layout: false)  
end


