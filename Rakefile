task :init => [:init_bundle, :init_npm, :init_bower] do
end

task :init_bundle do
  puts system("bundle install --path vendor/bundle") ? "OK" : "FAILED"
end

task :init_npm do
  puts system("npm install") ? "OK" : "FAILED"
end

task :init_bower do
  puts system("`npm bin`/bower install") ? "OK" : "FAILED"
end

task :build do
  puts system("bundle exec middleman build --clean") ? "OK" : "FAILED"
end
