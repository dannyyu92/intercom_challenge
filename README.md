# Intercom Coding Exercise

1. What's your proudest achievement? It can be a personal project or something you've worked 
on professionally. Just a short paragraph is fine, but I'd love to know why you're proud of it.

My proudest achievement was setting up an entire continuous integration workflow for 
the Rails applications at my last job. Prior to that, we were doing manual deployments, 
which involved manually tearing down our autoscaling groups and load balancers on AWS 
each time we had new code pushed to our staging servers. This process could take up 
to 30 minutes, and was incredibly time-consuming. Using Docker, AWS Elastic Beanstalk, 
and Travis CI, the new CI workflow I built was able to do all this automatically on 
each new push to git, as well as run through a test suite (which we did not have before), 
automate migrations, and manage secret keys, saving the company hours developer time.

2. 