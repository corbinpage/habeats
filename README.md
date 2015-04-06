Tables
------
* Users - One table for both proofreaders and regular users
* Jobs - The heart of the application, Most methods start here and move down through accepts nested attributes
* Messages - Created as a nested attributes of Job
  * Can also exist without a Job in which case a user has not been created
  * Planned to build out functionally, for sales request, versus job request with an account creation button
* Attachment - Created as a nested attribute of job
  * Can exist as part of just a message, if a user has not been created.
* Task - Belongs to a Job
  * Think of this more as a unit of time a proofreader spent working on a job.
  * Might need to think of a clear way of doing this.

Roles
_____
* Used enum method
* http://railsapps.github.io/rails-devise-roles/

Proofreader - Logged In User Authorization
-------------------------
* IMPORTANT - Each new controller action needs to be specified if both a user or an admin user can submit the task
* If this is not specified any user will be able to complete the action

Mailgun
-------
* [Development] Any emails sent to dev@proofypudding.com are forward('https://surge.fwd.wf/mailgun_receive_email')
* Please login into Thomas Surgent's forward account and run "forward 3000" to allow the local dev enviornment exposure to the internets
* [Production] Any emails sent to *@proofypudding.com are forwarded through the rails application
* We can only receive emails from one domain at a time.
  *http://documentation.mailgun.com/faqs.html#can-i-use-the-same-domain-name-for-mailgun-and-for-google-apps-or-another-email-server

Stripe
------
* https://stripe.com/docs/checkout/guides/rails
* Stripe test credit card number is "4242 4242 4242 4242", with any date and csv
* Passing the correct pricing values to stripe is tricky, BEWARE!!
  * Ensure correct in view as well as server!
* Built using Custom Checkout and Rails
* http://stackoverflow.com/questions/20049865/stripe-checkout-with-custom-integration-in-rails
* https://stripe.com/docs/checkout/guides/rails