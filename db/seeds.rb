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
range_colors = ["#eee","#d6e685","#8cc665","#44a340","#1e6823"]

goals.each do |goal|
  goal_obj = Goal.new(goal)
  goal_obj.save

  days.each do |i|
    day_obj = Day.new
    day_obj.date = (Date.today - i)
    day_obj.dofw = (day_obj.date.wday == 0 ? 7 : day_obj.date.wday)
    day_obj.week_num = (day_obj.date.year.to_s + day_obj.date.cweek.to_s.rjust(2,"0")).to_i
    day_obj.score = 1+Random.rand(9)
    day_obj.range_value = day_obj.score/2
    day_obj.range_color = range_colors[day_obj.range_value]
    day_obj.goal_id = goal_obj.id
    day_obj.save
  end

end