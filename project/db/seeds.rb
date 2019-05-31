# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#User creator
users = [User.new(email:"user1@asd.cl", name: "user1", password: "123456789"),
         User.new(email:"user2@asd.cl", name: "user2", password: "123456789"),
         User.new(email:"admin1@asd.cl", name: "admin1", password: "123456789"),
         User.new(email:"admin2@asd.cl", name: "admin2", password: "123456789"),
         User.new(email:"sadmin1@asd.cl", name: "sadmin1", password: "123456789"),
         User.new(email:"sadmin2@asd.cl", name: "sadmin2", password: "123456789")
]
for u in users do
  u.save!
end

#Geofence creator
geofences = [ Geofence.new(region: "Canto"),
              Geofence.new(region: "Johto")
]

for gf in geofences
  gf.save!
end


#Admins creator
admins = [Admin.new(user:users[2], geofence:geofences[0], super:false),
          Admin.new(user:users[3], geofence:geofences[1], super:false),
          Admin.new(user:users[4], geofence:geofences[0], super:true),
          Admin.new(user:users[5], geofence:geofences[1], super:true)
]

for ad in admins
  ad.save!
end


#Posts creator
posts =[Post.new(user:users[0], title:"User1 Post1", description:"blablabla11", location:"location1", date:DateTime.now),
        Post.new(user:users[0], title:"User1 Post2", description:"blablabla12", location:"location1", date:DateTime.now),
        Post.new(user:users[1], title:"User2 Post1", description:"blablabla21", location:"location3", date:DateTime.now),
        Post.new(user:users[1], title:"User2 Post2", description:"blablabla22", location:"location4", date:DateTime.now),
        Post.new(user:users[2], title:"User3 Post1", description:"blablabla31", location:"location5", date:DateTime.now),
        Post.new(user:users[2], title:"User3 Post2", description:"blablabla32", location:"location6", date:DateTime.now)
]

for pt in posts
  pt.save!
end


#Innapropiate posts creator
inappropiates= [Innapropiate.new(user:users[0], post:posts[0], coment:"inapropiate111"),
                Innapropiate.new(user:users[1], post:posts[2], coment:"inapropiate221"),
                Innapropiate.new(user:users[2], post:posts[4], coment:"inapropiate331")
]

for ina in inappropiates
  ina.save!
end


#Dumpster creator
dumpsters=[Dumpster.new(post:posts[0], date: DateTime.now)
]

for dps in dumpsters
  dps.save!
end


#Blacklist creator
blacklists=[Blacklist.new(user:users[1], date: DateTime.now)
]

for bls in blacklists
  bls.save!
end


#Votes creator
votes=[Vote.new(user:users[0] ,post:posts[2], vote:true),
       Vote.new(user:users[0] ,post:posts[3], vote:false),
       Vote.new(user:users[0] ,post:posts[4], vote:true),
       Vote.new(user:users[0] ,post:posts[5], vote:false),
       Vote.new(user:users[1] ,post:posts[0], vote:true),
       Vote.new(user:users[1] ,post:posts[1], vote:false),
       Vote.new(user:users[1] ,post:posts[4], vote:true),
       Vote.new(user:users[1] ,post:posts[5], vote:false),
       Vote.new(user:users[2] ,post:posts[0], vote:true),
       Vote.new(user:users[2] ,post:posts[1], vote:false),
       Vote.new(user:users[2] ,post:posts[2], vote:true),
       Vote.new(user:users[2] ,post:posts[3], vote:false)
]

for vt in votes
  vt.save!
end


#Profiles creator
profiles=[Profile.new(user:users[0],picture:"1", biography:"bio1", city:"cityA", country:"countryA"),
          Profile.new(user:users[1],picture:"2", biography:"bio2", city:"cityB", country:"countryB"),
          Profile.new(user:users[2],picture:"3", biography:"bio3", city:"cityC", country:"countryC"),
          Profile.new(user:users[3],picture:"4", biography:"bio4", city:"cityD", country:"countryD"),
          Profile.new(user:users[4],picture:"5", biography:"bio5", city:"cityE", country:"countryE"),
          Profile.new(user:users[5],picture:"6", biography:"bio6", city:"cityF", country:"countryF")
]

for prof in profiles
  prof.save!¿
end

#Comments creator
comments=[]

for u in users
  i = 0
  for po in posts
    comments << Comment.new(user: u, post: po, comment: "text"+u.id.to_s+po.id.to_s)
    i += 1
  end
end

for com in comments
  com.save!
end


