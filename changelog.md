<a name="2.0.0"></a>
# [2.0.0](https://github.com/packsaddle/ruby-git_clone_url/compare/v1.0.1...v2.0.0) (2015-12-07)


## Breaking change

* **deps:** update uri-ssh_git version ([0fc9c3f](https://github.com/packsaddle/ruby-git_clone_url/commit/0fc9c3f))


### diff between v1 and v2 behavior

```diff
 git_url = 'git://github.com/schacon/ticgit.git'
 ssh_url = 'git@github.com:schacon/ticgit.git'
 https_url = 'https://github.com/schacon/ticgit.git'
 https_url_with_userinfo = 'https://user:pass@github.com/schacon/ticgit.git'

 GitCloneUrl.parse(git_url)
 #=> #<URI::Generic git://github.com/schacon/ticgit.git>
 #=> {scheme: 'git', host: 'github.com', path: '/schacon/ticgit.git' }
 GitCloneUrl.parse(ssh_url)
 #=> #<URI::SshGit::Generic git@github.com:schacon/ticgit.git>
-#=> {scheme: nil, user: 'git', userinfo: 'git', host: 'github.com', path: '/schacon/ticgit.git' }
+#=> {scheme: nil, user: 'git', userinfo: 'git', host: 'github.com', path: 'schacon/ticgit.git' }
 GitCloneUrl.parse(https_url)
 #=> #<URI::HTTPS https://github.com/schacon/ticgit.git>
 #=> {scheme: 'https', host: 'github.com', path: '/schacon/ticgit.git'}
 GitCloneUrl.parse(https_url_with_userinfo)
 #=> #<URI::HTTPS https://user:pass@github.com/schacon/ticgit.git>
 #=> {scheme: 'https', userinfo: 'user:pass', user: 'user', password: 'pass',
 # host: 'github.com', path: '/schacon/ticgit.git'}
```

`git_clone_url` uses `uri-ssh_git` directly, so this changes `git_clone_url`
behavior.

* https://github.com/packsaddle/ruby-git_clone_url/issues/6
* https://github.com/packsaddle/ruby-uri-ssh_git/issues/14



<a name="2.0.0.pre.1"></a>
# [2.0.0.pre.1](https://github.com/packsaddle/ruby-git_clone_url/compare/v1.0.1...v2.0.0.pre.1) (2015-12-03)


<a name="1.0.1"></a>
## [1.0.1](https://github.com/packsaddle/ruby-git_clone_url/compare/v1.0.0...v1.0.1) (2015-12-02)

* **deps:** cap dependency version


<a name="1.0.0"></a>
# [1.0.0](https://github.com/packsaddle/ruby-git_clone_url/compare/v0.1.1...v1.0.0) (2015-11-21)

* This module is stable :)


<a name="0.1.1"></a>
## [0.1.1](https://github.com/packsaddle/ruby-git_clone_url/compare/v0.1.0...v0.1.1) (2015-11-21)

* Add changelog file
