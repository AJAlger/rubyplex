#RubyPlex

So, I got tired of writing Ruby in Sublime, or my IDE, and testing it in the terminal, or in IRB. Therefore, I got inspired by the [Webruby project](https://github.com/xxuejie/mruby-web-irb) by @xxuejie and decided to make my own Ruby editor in the browser. The benefit of this browser is that it is a cross between [JSBin](http://jsbin.com) and Github's Gists in that it let's you code, run your code, save your code, share your code, and let others run your code. 

I am open to contributions that are tested, but give it a go and have fun! [Try RubyPlex!](http://rubyplex.com(

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

#License

The MIT License (MIT)

Copyright (c) 2015 Abdullah Alger

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
