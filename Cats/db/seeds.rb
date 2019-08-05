# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do

    Cat.destroy_all

    c1 = Cat.create!(birth_date: '1995/9/6', color: 'red', name: 'muffin', sex: 'F',
    description: 'the man the myth the legend')
    c2 = Cat.create!(birth_date: '1995/9/6', color: 'grey', name: 'kevin', sex: 'M',
    description: 'super friendly, but not the nicest to dogs')
    c3 = Cat.create!(birth_date: '2000/5/1', color: 'black', name: 'josh', sex: 'M',
    description: 'can get mad')
    c4 = Cat.create!(birth_date: '1995/9/6', color: 'red', name: 'lili', sex: 'F', 
    description: 'beautiful cat')

    CatRentalRequest.destroy_all

    req = CatRentalRequest.create!(cat_id: c1.id, start_date: '2019/8/31', end_date: '2019/9/4')
    req = CatRentalRequest.create!(cat_id: c2.id, start_date: '2019/10/31', end_date: '2019/11/4')
    req = CatRentalRequest.create!(cat_id: c3.id, start_date: '2019/12/31', end_date: '2020/1/4')


end
