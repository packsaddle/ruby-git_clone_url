# GitCloneUrl

[![Gem version][gem-image]][gem-url] [![Travis-CI Status][travis-image]][travis-url] [![yard docs][docs-image]][docs-url]

> Easy to parse git repository-ish url.

* Parse by [URI.parse](http://ruby-doc.org/stdlib-2.2.3/libdoc/uri/rdoc/URI.html#method-c-parse)
    * `git://github.com/schacon/ticgit.git`
    * `https://github.com/schacon/ticgit.git`
* Parse by [URI::SshGit](https://rubygems.org/gems/uri-ssh_git)
    * `git@github.com:schacon/ticgit.git`


```ruby
require 'git_clone_url'

git_url = 'git://github.com/schacon/ticgit.git'
ssh_url = 'git@github.com:schacon/ticgit.git'
https_url = 'https://github.com/schacon/ticgit.git'
https_url_with_userinfo = 'https://user:pass@github.com/schacon/ticgit.git'

GitCloneUrl.parse(git_url)
#=> #<URI::Generic git://github.com/schacon/ticgit.git>
#=> {scheme: 'git', host: 'github.com', path: '/schacon/ticgit.git' }
GitCloneUrl.parse(ssh_url)
#=> #<URI::SshGit::Generic git@github.com:schacon/ticgit.git>
#=> {scheme: nil, user: 'git', userinfo: 'git', host: 'github.com', path: 'schacon/ticgit.git' }
GitCloneUrl.parse(https_url)
#=> #<URI::HTTPS https://github.com/schacon/ticgit.git>
#=> {scheme: 'https', host: 'github.com', path: '/schacon/ticgit.git'}
GitCloneUrl.parse(https_url_with_userinfo)
#=> #<URI::HTTPS https://user:pass@github.com/schacon/ticgit.git>
#=> {scheme: 'https', userinfo: 'user:pass', user: 'user', password: 'pass',
# host: 'github.com', path: '/schacon/ticgit.git'}
```

## Motivation

`URI.parse` and `Addressable::URI.parse`
can parse https protocol, git protocol and ssh protocol(`ssh://git@github.com...`),
but they can not parse `git@github.com:foo/bar.git` pattern of ssh protocol.

```ruby
# URI
url = URI.parse('git@github.com:schacon/ticgit.git')
URI::InvalidURIError: bad URI(is not URI?): git@github.com:schacon/ticgit.git

# Addressable
url = Addressable::URI.parse('git@github.com:schacon/ticgit.git')
#=> #<Addressable::URI:0x3fedf48fb430 URI:git@github.com:schacon/ticgit.git>
url.path #=> "schacon/ticgit.git"
url.scheme #=> "git@github.com"

url.host #=> nil
url.userinfo #=> nil
url.user #=> nil
url.port #=> nil
```


## API

### GitCloneUrl.parse(git_url) -> URI::*

Return `URI` namespaced object.
E.g. `URI::Generic`, `URI::HTTPS` and `URI::SshGit::Generic`.
See: [class URI::Generic](http://docs.ruby-lang.org/en/2.2.0/URI/Generic.html), [class URI::HTTPS](http://docs.ruby-lang.org/en/2.2.0/URI/HTTPS.html) and [URI::SshGit](https://github.com/packsaddle/ruby-uri-ssh_git).


#### git_url

*Required*
Type: `string`

Git repository-ish url.

*[details][docs-url]*.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'git_clone_url'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install git_clone_url

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/packsaddle/ruby-git_clone_url/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[travis-url]: https://travis-ci.org/packsaddle/ruby-git_clone_url
[travis-image]: https://img.shields.io/travis/packsaddle/ruby-git_clone_url/master.svg?style=flat-square&label=build%20%28linux%29
[gem-url]: https://rubygems.org/gems/git_clone_url
[gem-image]: http://img.shields.io/gem/v/git_clone_url.svg?style=flat-square
[docs-url]: http://www.rubydoc.info/gems/git_clone_url
[docs-image]: https://img.shields.io/badge/yard-docs-blue.svg?style=flat-square
