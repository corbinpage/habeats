task :kill_postgres => :environment do
  db_name = "project_doublcheck_development"
  sh = <<EOF
ps xa \
  | grep postgres: \
  | grep #{db_name} \
  | grep -v grep \
  | awk '{print $1}' \
  | xargs kill
EOF
  puts `#{sh}`
end

task :add_day => :environment do
  Rails.env.development? ? sleep(1) : sleep(1.minutes)
  Goal.all.each do |g|
    g.add_today
  end

end