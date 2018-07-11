User.destroy_all
Artist.destroy_all
Performance.destroy_all

User.create(name: "Ruby Weiner")
User.create(name: "Andres Manco")
User.create(name: "Juan Simosa")
User.create(name: "Fernando Perez")
User.create(name: "Michael Ortega")
User.create(name: "Mariana Larez")
User.create(name: "Yeri Sanchez")
User.create(name: "Jose Arocha")
User.create(name: "Christian Martinez")
User.create(name: "Emma Sargeant")
User.create(name: "Gaby Ortiz")
User.create(name: "Genesis Pacocano")


Artist.create(name: "Avicii")
Artist.create(name: "Steve Aoki")
Artist.create(name: "Tiesto")
Artist.create(name: "David Guetta")
Artist.create(name: "Martin Garrix")


Performance.create(time: "2018-08-15 [11:00:00]", stage: 1)
Performance.create(time: "2018-08-15 [11:30:00]", stage: 1)
Performance.create(time: "2018-08-15 [12:00:00]", stage: 2)
Performance.create(time: "2018-08-15 [12:00:00]", stage: 3)
Performance.create(time: "2018-08-15 [12:30:00]", stage: 1)
Performance.create(time: "2018-08-16 [11:00:00]", stage: 1)
Performance.create(time: "2018-08-16 [11:30:00]", stage: 2)
Performance.create(time: "2018-08-16 [11:30:00]", stage: 3)
Performance.create(time: "2018-08-16 [12:00:00]", stage: 3)
