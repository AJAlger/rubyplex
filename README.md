# New Developer Environment Setup

```bash
git clone your-fork-of-the-repo

cd rubyplex/

# Install bower dependencies
bower install

bundle install

bin/rake db:setup

# Setup user: neo/a@a.a/password
bin/rake db:seed

# Run tests
bin/rspec

# Run server
bin/rails s
```
