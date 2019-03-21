require_relative('../models/miniwhizz')
require_relative('../models/house')
require('pry')

MiniWhizz.delete_all()
House.delete_all()

house1 = House.new({
  "house_name" => "Ravenclaw"
  })

house2 = House.new({
  "house_name" => "Slytherin"
  })

house3 = House.new({
  "house_name" => "Hufflepuff"
  })

house4 = House.new({
  "house_name" => "Gryffindor"
  })

  house1.save()
  house2.save()
  house3.save()
  house4.save()


  miniwhizz1 = MiniWhizz.new({
    "first_name" => "Grant",
    "second_name" => "Rutherford",
    "house" => "Ravenclaw",
    "age" => 31,
    "house_id" => house1.id
    })

  miniwhizz2 = MiniWhizz.new({
    "first_name" => "Ben",
    "second_name" => "Barker",
    "house" => "Ravenclaw",
    "age" => 27,
    "house_id" => house1.id
    })

    miniwhizz1.save()
    miniwhizz2.save()
  # MiniWhizz.all()
  # MiniWhizz.find(11)



miniwhizz1.house()
house1.miniwhizz()

  binding.pry
  nil
