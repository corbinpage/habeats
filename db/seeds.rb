users = [{email: "surgentt@gmail.com",            name: "Thomas Surgent"}, 
         {email: "dpooser@sas.upenn.edu",         name: "Damon Pooser"},
         {email: "ellenpisano@gmail.com",         name: "Ellen Pisano"},
         {email: "Kkoenig226@gmail.com",          name: "Kate Koeinig"},
         {email: "sharonchen943@gmail.com",       name: "Sharon Chen"},
         {email: "corbin.page@gmail.com",         name: "Corbin Page"},
         {email: "anthony@blinkapplications.com", name: "Anthony Guidarelli"}
        ]
users.each do |user|
  user = User.new(
    email: user[:email], 
    name: user[:name], 
    password: "proofreader", 
    password_confirmation: "proofreader")
  user.proofreader!
  user.save
end