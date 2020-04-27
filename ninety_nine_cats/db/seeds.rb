# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all
CatRentalRequest.destroy_all

tink, pounce, oddball = Cat.create!([
    {name: "Tinkerbell",
    birth_date: Date.new(2015,2,3),
    sex: 'F',
    color: "Cinnamon",
    description: "Never have a spoonful of me"
    },
    {name: "Sir Pounce",
    birth_date: Date.new(2012,8,22),
    sex: 'M',
    color: "Black",
    description: "Sneak Attack! >:)"
    },
    {name: "Oddball",
    birth_date: Date.new(2017,12,11),
    sex: 'M',
    color: "Ginger",
    description: "Meoow"
    }
])

CatRentalRequest.create!([{cat_id: tink.id, start_date: Date.new(2020,4,25), end_date:Date.new(2020,4,30), status: 'APPROVED'},
    {cat_id: pounce.id, start_date: Date.new(2020,4,25), end_date:Date.new(2020,4,30)},
    {cat_id: oddball.id, start_date: Date.new(2020,4,26), end_date:Date.new(2020,4,30), status: 'DENIED'}
])

cat_id: 27, start_date: Date.new(2020,4,29), end_date:Date.new(2020,5,5)