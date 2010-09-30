#!/usr/bin/env ruby
#
# Sample script for fetching a page's current contents in Wiki markup
#
require 'media_wiki/gateway'
require 'media_wiki/config'

config = MediaWiki::Config.new ARGV 
config.abort("Name of article is mandatory.") unless config.article

mw = MediaWiki::Gateway.new(config.url, Logger::DEBUG)
mw.login(config.user, config.pw)
content = ARGF.read.to_s
puts mw.create(config.article, content, {:overwrite => true, :summary => config.summary})
