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

#artwork_id, viewer_id
shares = ArtworkShare.create([
    
    { artwork_id:1, viewer_id:2 },
    { artwork_id:1, viewer_id:3 },
    { artwork_id:1, viewer_id:4 },
    { artwork_id:1, viewer_id:5 },
    { artwork_id:1, viewer_id:6 },
    { artwork_id:1, viewer_id:7 },
    { artwork_id:2, viewer_id:7 },
    { artwork_id:2, viewer_id:2 },
    { artwork_id:2, viewer_id:3 },
    { artwork_id:2, viewer_id:4 },
    { artwork_id:2, viewer_id:5 },
    { artwork_id:2, viewer_id:6 },
    { artwork_id:2, viewer_id:1 },
    { artwork_id:4, viewer_id:3 },
    { artwork_id:4, viewer_id:4 },
    { artwork_id:4, viewer_id:5 },
    { artwork_id:4, viewer_id:6 },
    { artwork_id:4, viewer_id:7 },
    { artwork_id:5, viewer_id:2 },
    { artwork_id:5, viewer_id:3 },
    { artwork_id:5, viewer_id:6 },
    { artwork_id:5, viewer_id:7 },
    { artwork_id:6, viewer_id:3 },
    { artwork_id:6, viewer_id:4 },
    { artwork_id:6, viewer_id:5 },
    { artwork_id:6, viewer_id:6 },
    { artwork_id:6, viewer_id:1 },
    { artwork_id:3, viewer_id:3 },
    { artwork_id:7, viewer_id:4 },
    { artwork_id:8, viewer_id:5 },
    { artwork_id:9, viewer_id:6 },
    { artwork_id:10, viewer_id:1 },
    { artwork_id:11, viewer_id:3 },
    { artwork_id:11, viewer_id:4 },
    { artwork_id:11, viewer_id:5 },
    { artwork_id:12, viewer_id:6 },
    { artwork_id:12, viewer_id:1 }


])