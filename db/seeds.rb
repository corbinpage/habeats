users = [ {email: "corbin.page@gmail.com",  name: "Corbin Page"},
  {email: "surgentt@gmail.com",     name: "Thomas Surgent"}
]
users.each do |user|
  user = User.new(
                  email: user[:email], 
                  name: user[:name], 
                  password: "password", 
                  password_confirmation: "password")
  user.save
end

new_goal = Goal.new({name: "7min",  category: "Health", theme: "habeats-blue", user_id: 1})
new_goal.save!
file = File.read('db/seven-export.json')
day_hash = JSON.parse(file)
# binding.pry
new_goal.progresses = day_hash.map do |d| 
  Progress.create(new_goal.id,d["date"],d["score"])
end
new_goal.save!

# goals = [{name: "Workout",  category: "Health", theme: "habeats-blue", user_id: 1}, 
#  {name: "Eating",  category: "Health", theme: "habeats-green", user_id: 1}, 
#  {name: "Code",  category: "Work", theme: "habeats-yellow", user_id: 1} 
# ]

# goals.each do |g|
#   goal_obj = Goal.new(g)
#   goal_obj.initialize_progresses
#   # goal_obj.initialize_empty_progresses
#   goal_obj.save
# end