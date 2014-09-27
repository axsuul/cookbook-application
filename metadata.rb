name             "application"
maintainer       "James Hu"
maintainer_email "axsuul@gmail.com"
license          "All rights reserved"
description      "Cookbook for dealing with applications and deployments"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.2"

recipe           "default", "Override this"
recipe           "rails", "Ruby on Rails"
