# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
Teahouse.destroy_all
BobaTea.destroy_all
Request.destroy_all
BobaTeaRequest.destroy_all
# Teahouses
@honey_pot    = Teahouse.create!(name: "Honey Pot Teahouse", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
@lily_pad     = Teahouse.create!(name: "Lily Pad Teahouse", address: "123 Silly Ave", city: "Longmont", state: "CO", zip: 80012)
@bent_straw   = Teahouse.create!(name: "Bent Straw Teahouse", address: "102 Shelter Dr.", city: "Commerce City", state: "CO", zip: 80022)
# Boba Teas
@thai_boba    = @honey_pot.boba_teas.create!(image:"", name: "Thai Boba Tea", base: 'Thai Tea', price: 4.96, 
                                             description: "Smooth taste with hints of cream and exotic spices", caffeinated: false)
@coffee_boba  = @lily_pad.boba_teas.create!(image:"", name: "Coffee Boba Tea", base: 'Black Tea', price: 5.08, 
                                            description: "Rich and decadent mocha and java flavors", caffeinated: true)
@matcha_boba  = @bent_straw.boba_teas.create!(image:"", name: "Matcha Boba Tea", base: 'Green Tea', price: 7.50, 
                                              description: "Bitter sweet matcha, good for your mouth and soul", caffeinated: false)
# Requests
@ms_jenkins   = Request.create!({name: 'Buttercup Jenkins', address: "101 Puppy Love Lane", 
                                city: 'Aurora', state: 'CO', zip: 80017, 
                                reason: 'Customers requesting this flavor', status: 0})
@mr_bopbop    = Request.create!({name: 'Bogosh Bopbop', address: "205 Cats Dont Dance Dr", 
                                city: 'Littleton', state: 'CO', zip: 80012, 
                                reason: 'Currently carrying this and need to replenish', status: 0})
# Boba Tea Requests 
BobaTeaRequest.create!(request: @ms_jenkins, boba_tea: @thai_boba)
BobaTeaRequest.create!(request: @ms_jenkins, boba_tea: @coffee_boba)
BobaTeaRequest.create!(request: @mr_bopbop, boba_tea: @matcha_boba)
