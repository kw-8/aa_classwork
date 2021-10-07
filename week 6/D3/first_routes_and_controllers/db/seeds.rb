# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([ { username: 'Pineapple Pizza' },
                      { username: 'Leonardo' },
                      { username: 'Michelangelo' },
                      { username: 'Frida' },
                      { username: 'Georgia O\Keefe' },
                      { username: 'Yayoi Kusama' },
                      { username: 'Yoko Ono' }
                    ])
artworks = Artwork.create([
  { title: 'baby pineapples',
    image_url: '1.com',
    artist_id: 1
  },
  { title: 'mona pizza',
    image_url: '2.com',
    artist_id: 1
  },
  { title: 'pineappleism',
    image_url: '3.com',
    artist_id: 1
  },
  { title: 'the best fruit',
    image_url: '4.com',
    artist_id: 1
  },
  { title: 'mona lisa',
    image_url: '5.com',
    artist_id: 2
  },
  { title: 'self portrait',
    image_url: '6.com',
    artist_id: 2
  },
  { title: 'self portrait',
    image_url: '7.com',
    artist_id: 4
  },
  { title: 'pietà',
    image_url: '8.com',
    artist_id: 3
  },
  { title: 'creation of adam',
    image_url: '9.com',
    artist_id: 3
  },
  { title: 'infinity rooms',
    image_url: '10.com',
    artist_id: 6
  },
  { title: 'pineapple bud',
    image_url: '11.com',
    artist_id: 5
  },
  { title: 'Oriental Poppies',
    image_url: '12.com',
    artist_id: 5
  }

])