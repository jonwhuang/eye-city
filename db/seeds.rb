Admin.create(email: "jonwhuang@gmail.com", password: "12345678")

marchon = Manufacturer.create(name: "Marchon")
luxottica = Manufacturer.create(name: "Luxottica")
marcolin = Manufacturer.create(name: "Marcolin")

ck = Brand.create(name: "Calvin Klein")
ck.manufacturers << marchon

nike = Brand.create(name: "Nike")
nike.manufacturers << marchon

rb = Brand.create(name: "Ray Ban")
rb.manufacturers << luxottica

tf = Brand.create(name: "Tom Ford")
tf.manufacturers << marcolin

