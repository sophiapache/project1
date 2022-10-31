User.destroy_all
u1 = User.create :email => 'sophpache@gmail.com'
u2 = User.create :email => 'joel@ga.co'
puts "#{ User.count } users"
