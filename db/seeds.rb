# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

apartment = PropertyType.where(name: "Apartment").first_or_create(name: "Apartment")
condo = PropertyType.where(name: "Condo").first_or_create(name: "Condo")
house = PropertyType.where(name: "House").first_or_create(name: "House")
townhouse = PropertyType.where(name: "Townhouse").first_or_create(name: "Townhouse")
other = PropertyType.where(name: "Other").first_or_create(name: "Other")

Renters.where(fname: "Francisco", lname: "Payne").first_or_create(fname: "Francisco", lname: "Payne", license_no: "X3886908", description: "male", city: "Diablo", state: "CA", phone: "5919439454", email:"francpayne@lipperlloo.info")
Renters.where(fname: "Melvin", lname: "Brooks").first_or_create(fname: "Melvin", lname: "Brooks", license_no: "BG20610762090", description: "male", city: "Brooksville", state: "FL", phone: "3905734328", email:"melv.brook@burgundy1.com")
Renters.where(fname: "Mildred", lname: "Romero").first_or_create(fname: "Mildred", lname: "Romero", license_no: "U5380078", description: "female red hair", city: "Carmel", state: "CA", phone: "2017369858", email:"mildrrom@labels11.com")
Renters.where(fname: "Wesley", lname: "Castro").first_or_create(fname: "Wesley", lname: "Castro", license_no: "Z8157806", description: "male brunette", city: "Apple Valley", state: "CA", phone: "7058016475", email:"caswesl@fropp.com")
Renters.where(fname: "Johnnie", lname: "Gordon").first_or_create(fname: "Johnnie", lname: "Gordon", license_no: "G635768881232", description: "male brunette with Mercedes C250", city: "Annapolis", state: "MD", phone: "7876688808", email:"gjohnn@suremail.info")

Renters.where(fname: "James", lname: "Hanson").first_or_create(fname: "James", lname: "Hanson", license_no: "527553565", description: "male drives Audi A3", city: "Buffalo", state: "NY", phone: "5024759189", email:"ha.james@suremail.info")
Renters.where(fname: "Brandi", lname: "Griffin").first_or_create(fname: "Brandi", lname: "Griffin", license_no: "G61306494896", description: "female red hair with BMW X5", city: "Aurora", state: "IL", phone: "5298495108", email:"bran.griffit@tradermail.info")
Renters.where(fname: "Dustin", lname: "Frazier").first_or_create(fname: "Dustin", lname: "Frazier", license_no: "527337740", description: "male blonde hair drives MB C350", city: "Milton", state: "MA", phone: "5499948434", email:"fdusti@labels11.com")
Renters.where(fname: "Matthew", lname: "West").first_or_create(fname: "Matthew", lname: "West", license_no: "WESTMT762NB", description: "male brown hair from CA", city: "Seattle", state: "WA", phone: "3917971466", email:"mattheww@safetymail.info")
Renters.where(fname: "Rene", lname: "Tucker").first_or_create(fname: "Rene", lname: "Tucker", license_no: "H9304569", description: "male 5' 11", city: "San Jose", state: "CA", phone: "9058189394", email:"tu.ren@fishingoo.com")

#Renters.where(fname: "", lname: "").first_or_create(fname: "", lname: "", license_no: "", description: "", city: "", state: "", phone: "", email:"")