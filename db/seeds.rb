users = [{email: "surgentt@gmail.com",            name: "Thomas Surgent"}, 
 {email: "corbin.page@gmail.com",         name: "Corbin Page"}
]
users.each do |user|
  user = User.new(
                  email: user[:email], 
                  name: user[:name], 
                  password: "password", 
                  password_confirmation: "password")
  user.save
end

goals = [{name: "Workout",  category: "Health", theme: "habeats-blue", user_id: 2}, 
 {name: "Eating",  category: "Health", theme: "habeats-green", user_id: 2}, 
 {name: "Code",  category: "Work", theme: "habeats-yellow", user_id: 2} 
]

days = (0..300).to_a

goals.each do |g|
  goal_obj = Goal.new(g)
  goal_obj.save

  days.each do |i| 
    score = (Rails.env.development? ? Random.rand(9) : 0)
    goal_obj.add_date(Date.today - i, score)
  end

end