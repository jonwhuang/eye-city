Admin.create(email: "jonwhuang@gmail.com", password: "12345678")

marchon = Manufacturer.create(name: "Marchon") #1
luxottica = Manufacturer.create(name: "Luxottica") #2
marcolin = Manufacturer.create(name: "Marcolin") #3
classique = Manufacturer.create(name: "Classique") #4
kenmark = Manufacturer.create(name: "Kenmark") #5
safilo = Manufacturer.create(name: "Safilo") #6
ovvo = Manufacturer.create(name: "OVVO") #7
premiere = Manufacturer.create(name: "Premiere Vision") #8
charmant = Manufacturer.create(name: "Charmant") #9
prodesign = Manufacturer.create(name: "Prodesign") #10

#Marchon 1
ck = Brand.create(name: "Calvin Klein") #1
nike = Brand.create(name: "Nike") #2
nautica = Brand.create(name: "Nautica") #3
marchon.brands << ck << nike << nautica

#Luxottica 2
rb = Brand.create(name: "Ray-Ban") #4
dg = Brand.create(name: "D&G") #5
oakley = Brand.create(name: "Oakley") #6
coach = Brand.create(name: "Coach") #7
versace = Brand.create(name: "Versace") #8
polo = Brand.create(name: "Polo") #9
burberry = Brand.create(name: "Burberry") #10
luxottica.brands << rb << dg << oakley << coach << versace << polo << burberry
marchon.brands << coach

#Marcolin 3
tf = Brand.create(name: "Tom Ford") #11
rc = Brand.create(name: "Roberto Cavalli") #12
marcolin.brands << tf << rc

#Safilo 6
ks = Brand.create(name: "Kate Spade") #13
dior = Brand.create(name: "Dior") #14
safilo.brands << ks << dior

#Classique 4
evatik = Brand.create(name: "Evatik") #15
fysh = Brand.create(name: "FYSH") #16
kliik = Brand.create(name: "Kliik") #17
classique.brands << evatik << fysh << kliik

#Kenmark 5
lp = Brand.create(name: "Lilly Pulitzer") #18
vw = Brand.create(name: "Vera Wang") #19
kenmark.brands << lp << vw

#OVVO 7
o = Brand.create(name: "OVVO") #20
ovvo.brands << o

#Premiere Vision 8
th = Brand.create(name: "Tag Heuer") #21
premiere.brands << th

#Charmant 9
ct = Brand.create(name: "Charmant Titanium") #22
charmant.brands << ct

#Prodesign 10
p = Brand.create(name: "Prodesign") #23
prodesign.brands << p

#Returns
Return.create(auth_number: rand(1..999999999), return_date: "2016-01-14", frame_count: 2, brand_id: 4, manufacturer_id: 2)

Return.create(auth_number: rand(1..999999999), return_date: "2016-01-12", frame_count: 5, brand_id: 5, manufacturer_id: 2)

Return.create(auth_number: rand(1..999999999), return_date: "2016-01-12", frame_count: 13, brand_id: 6, manufacturer_id: 2)

Return.create(auth_number: rand(1..999999999), return_date: "2016-01-26", frame_count: 3, brand_id: 7, manufacturer_id: 2)

Return.create(auth_number: rand(1..999999999), return_date: "2016-01-26", frame_count: 1, brand_id: 8, manufacturer_id: 2)

Return.create(auth_number: rand(1..999999999), return_date: "2016-01-28", frame_count: 6, brand_id: 9, manufacturer_id: 2)

Return.create(auth_number: rand(1..999999999), return_date: "2016-01-19", frame_count: 7, brand_id: 15, manufacturer_id: 4)

Return.create(auth_number: rand(1..999999999), return_date: "2016-01-19", frame_count: 3, brand_id: 16, manufacturer_id: 4)

Return.create(auth_number: rand(1..999999999), return_date: "2016-01-19", frame_count: 5, brand_id: 17, manufacturer_id: 4)

Return.create(auth_number: rand(1..999999999), return_date: "2016-01-04", frame_count: 1, brand_id: 18, manufacturer_id: 5)

Return.create(auth_number: rand(1..999999999), return_date: "2016-01-04", frame_count: 8, brand_id: 19, manufacturer_id: 5)

Return.create(auth_number: rand(1..999999999), return_date: "2016-01-22", frame_count: 1, brand_id: 6, manufacturer_id: 2, comments: "Frame defective warranty for Jones, Bob")

Return.create(auth_number: rand(1..999999999), return_date: "2016-01-25", frame_count: 21, brand_id: 10, manufacturer_id: 2)

Return.create(auth_number: rand(1..999999999), return_date: "2016-02-19", frame_count: 4, brand_id: 4, manufacturer_id: 2)

Return.create(auth_number: rand(1..999999999), return_date: "2016-02-16", frame_count: 3, brand_id: 20, manufacturer_id: 7)

Return.create(auth_number: rand(1..999999999), return_date: "2016-02-22", frame_count: 1, brand_id: 13, manufacturer_id: 6)

Return.create(auth_number: rand(1..999999999), return_date: "2016-02-23", frame_count: 1, brand_id: 14, manufacturer_id: 6)

Return.create(auth_number: rand(1..999999999), return_date: "2016-02-10", frame_count: 5, brand_id: 21, manufacturer_id: 8)

Return.create(auth_number: rand(1..999999999), return_date: "2016-03-10", frame_count: 1, brand_id: 4, manufacturer_id: 2, comments: "Frame defective warranty for Horn, James")

Return.create(auth_number: rand(1..999999999), return_date: "2016-03-07", frame_count: 1, brand_id: 22, manufacturer_id: 9)

Return.create(auth_number: rand(1..999999999), return_date: "2016-03-14", frame_count: 7, brand_id: 23, manufacturer_id: 10)

Return.create(auth_number: "9923599", return_date: "2016-03-10", frame_count: 3, brand_id: 2, manufacturer_id: 1)

Return.create(auth_number: "9923599", return_date: "2016-03-10", frame_count: 1, brand_id: 3, manufacturer_id: 1)

