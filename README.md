Summary
=======
This extension allows you to add Stripe payment module to your shop. You can link it with your Stripe account to charge money for clients'
 orders.

Installation
============

Stripe Clerk is used in sales_clerk, you can see how to use it there.
If you want to use it in your own shop, follow the steps below:

* add stripe_clerk engine by adding the following lines to your shop's Gemfile:

  ` gem 'stripe_clerk' `

  ` gem 'stripe' `

* add the following line to routes (sales_clerk/config/routes.rb):

  ` mount StripeClerk::Engine => "/" `

* add the following line to sales_clerk/app/assets/javascripts/sales_clerk.js:

  ` //= require stripe_clerk/charges `

* add styling to sales_clerk's app/assets/stylesheets/sales_clerk.css.scss (link).

* add partial view payment_stripe.haml or roll your own view

  ` = render :partial => 'payment_stripe', :locals => { :order => @order } `


Configuration
=============
In order to use to make charges, you need to have a Stripe account. You can register [here](https://stripe.com).

1. Configure your Stripe account credits.

  Link your credentials from Stripe account (Your Account -> Account setting -> API keys) with environment variables in config/initializers/stripe.rb:

  * publishable_key => ENV['STRIPE_PUBLISHABLE_KEY']
  * secret_key => ENV['STRIPE_SECRET_KEY']

  Remember not to put them directly into app!

2. You can also custom your Stripe's frame appearance, for example adding your shop logo, label or change currency. More details in [Stripe checkout documentation](https://stripe.com/docs/checkout).

![stripe](/app/assets/images/stripe.png)

3. Change the logo on the stripe form by adding a your_stripe_logo.png to your assets.
4. Add your company name to the for by setting locale key stripe_clerk.company

Credits
====
Stripe Clerk engine was made as a project of [Rails Girls Summer of Code 2015](http://railsgirlssummerofcode.org) program.

__RubyClerks:__ Thanks to project author and our amazing mentor [Torsten Rüger](https://github.com/dancinglightning)

__TeamGirlsCodersWarsaw:__ Thanks to our fantastic coaches: [Jarek](https://github.com/pjar), [Łukasz](https://github.com/lsolniczek), [Tomasz](https://github.com/tomash) and [Piotr](https://github.com/chastell) and our lovely supervisor [Magda](https://github.com/madziaf)!

__Authors:__ [Anna Góra](https://github.com/Czarrrna) & [Barbara Kłosowska](https://github.com/aberracja) & [Torsten Ruger](https://github.com/dancinglightning)
