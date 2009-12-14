HtmlSanitizer
=============

A simple wrapper for the sanitize gem to easily sanitize attributes in your model. The sanitization
is done using a before_save callback.

Example
=======

Lets say you have a User model that has a name, and a description. In the User model simply enter:

html_sanitizer :sanitize => [:name, :description]


If you wanted to customize the sanitizer (read the sanitize gem), simply add to the options hash:

html_sanitizer :sanitize => [:name, :description], :options  => Sanitize::Config::RESTRICTED

================================================================
Copyright (c) 2009 RubyMiner LLC, released under the MIT license
