task :init => [:init_bundle, :init_npm, :init_bower, :init_contentful] do
end

task :init_wercker => [:init_bundle_wercker, :init_npm, :init_bower] do
end

task :init_docker => [:init_bundle_wercker, :init_npm_docker] do
end

task :init_circleci => [:init_bundle, :init_npm, :init_bower] do
end

task :init_bundle do
  fail 'FAILED' unless system("bundle install --path vendor/bundle")
end

task :init_bundle_wercker do
  fail 'FAILED' unless system("bundle install")
end

task :init_npm do
  fail 'FAILED' unless system("npm install")
end

task :init_npm_docker do
  fail 'FAILED' unless system('npm install -g bower')
end

task :init_bower do
  fail 'FAILED' unless system("`npm bin`/bower --allow-root install")
end

task :init_contentful do
  fail 'FAILED' unless system("bundle exec middleman contentful")
end

task :build do
  FileUtils.rm_rf './build/'
  system 'git clone --branch "gh-pages" "https://github.com/seisahachioji/seisafesta2015.git" build/'
  Dir.chdir './build' do
    system 'git rm -rf ./*'
  end
  fail 'FAILED' unless system("bundle exec middleman build --clean --verbose")
end

task :preview do
  fail 'FAILED' unless system 'bundle exec middleman server'
end

task :deploy do
  name  = `git config --global --get user.name`
  email = `git config --global --get user.email`
  begin
    Dir.chdir './build/' do
      fail 'FAILED' unless system 'git config --global user.name "CircleCI (Shuma Yoshioka)"'
      fail 'FAILED' unless system 'git config --global user.email "s64.stdio+circleci@gmail.com"'

      fail 'FAILED' unless system 'git checkout "gh-pages"'
      fail 'FAILED' unless system 'git add -A'
      fail 'FAILED' unless system 'git commit -m "Update"'
      fail 'FAILED' unless system 'git push'
    end
  rescue
  ensure
    system 'git config --global user.name %s' % name
    system 'git config --global user.email %s' % email
  end
end
