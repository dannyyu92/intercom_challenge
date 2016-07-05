# Intercom Coding Exercise

## Q1

My proudest achievement was setting up an entire continuous integration workflow for 
the Rails applications at my last job. Prior to that, we were doing manual deployments, 
which involved manually tearing down our autoscaling groups and load balancers on AWS 
each time we had new code pushed to our staging servers. This process could take up 
to 30 minutes, and was incredibly time-consuming. Using Docker, AWS Elastic Beanstalk, 
and Travis CI, the new CI workflow I built was able to do all this automatically on 
each new push to git, as well as run through a test suite (which we did not have before), 
automate migrations, and manage secret keys, saving the company hours developer time.

## Q2

Files are in the `q2` folder. To run, `chmod +x ./q2.rb` and run `./q2.rb`. Please note that I was running `ruby 2.3.0`.

For testing, I used the `minitest` gem as my unit test framework. You must `gem install minitest` and then run `ruby -Ilib -e 'ARGV.each { |f| require f }' ./tests/test*.rb` to run the tests.

# Author

Danny Yu  
dannyyu92 [at] gmail.com  