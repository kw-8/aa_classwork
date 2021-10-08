# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.create([
  { name: 'Melon',
    birth_date: '2016/09/28',
    color: 'black',
    sex: 'F',
    description: 'ashdfjkl'
  },
  { name: 'Casaba',
  birth_date: '2016/05/04',
  color: 'black',
  sex: 'M',
  description: 'hates cucumbers'
  },
  { name: 'Kit',
  birth_date: '2016/09/28',
  color: 'calico',
  sex: 'F',
  description: 'likes fish'
  },
  { name: 'Paulo',
  birth_date: '2016/09/28',
  color: 'rust',
  sex: 'M',
  description: 'hates socks'
  },
  { name: 'Chairs',
  birth_date: '2016/09/28',
  color: 'grey',
  sex: 'F',
  description: 'falls off ledges'
  }
])