Admin.create(email: "jonwhuang@gmail.com", password: "12345678")

marchon = Manufacturer.create(name: "Marchon")
luxottica = Manufacturer.create(name: "Luxottica")
marcolin = Manufacturer.create(name: "Marcolin")
classique = Manufacturer.create(name: "Classique")
kenmark = Manufacturer.create(name: "Kenmark")
safilo = Manufacturer.create(name: "Safilo")
ovvo = Manufacturer.create(name: "OVVO")
premiere = Manufacturer.create(name: "Premiere Vision")
charmant = Manufacturer.create(name: "Charmant")
prodesign = Manufacturer.create(name: "Prodesign")

#Marchon
ck = Brand.create(name: "Calvin Klein")
nike = Brand.create(name: "Nike")
nautica = Brand.create(name: "Nautica")
marchon.brands << ck << nike << nautica

#Luxottica
rb = Brand.create(name: "Ray-Ban")
dg = Brand.create(name: "D&G")
oakley = Brand.create(name: "Oakley")
coach = Brand.create(name: "Coach")
versace = Brand.create(name: "Versace")
polo = Brand.create(name: "Polo")
burberry = Brand.create(name: "Burberry")
luxottica.brands << rb << dg << oakley << coach << versace << polo << burberry

#Marcolin
tf = Brand.create(name: "Tom Ford")
rc = Brand.create(name: "Roberto Cavalli")
marcolin.brands << tf << rc

#Safilo
ks = Brand.create(name: "Kate Spade")
dior = Brand.create(name: "Dior")
safilo.brands << ks << dior

#Classique
evatik = Brand.create(name: "Evatik")
fysh = Brand.create(name: "FYSH")
kliik = Brand.create(name: "Kliik")
classique.brands << evatik << fysh << kliik

#Kenmark
lp = Brand.create(name: "Lilly Pulitzer")
vw = Brand.create(name: "Vera Wang")
kenmark.brands << lp << vw

#OVVO
o = Brand.create(name: "OVVO")
ovvo.brands << ovvo

#Premiere Vision
th = Brand.create(name: "Tag Heuer")
premiere.brands << th

#Charmant
ct = Brand.create(name: "Charmant Titanium")
charmant.brands << ct

#Prodesign
p = Brand.create(name: "Prodesign")
prodesign.brands << p
