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
Return.create(auth_number: rand(1..999999999), return_date: "16-01-14", frame_count: 2, brand_id: 4, manufacturer_id: 2)
