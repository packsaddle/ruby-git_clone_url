require '../lib/git_clone_url'

git_url = 'git://github.com/schacon/ticgit.git'
ssh_url = 'git@github.com:schacon/ticgit.git'
https_url = 'https://github.com/schacon/ticgit.git'
https_url_with_userinfo = 'https://user:pass@github.com/schacon/ticgit.git'

GitCloneUrl.parse(git_url)
#=> {scheme: 'git', host: 'github.com', path: '/schacon/ticgit.git' }
GitCloneUrl.parse(ssh_url)
#=> {scheme: nil, user: 'git', userinfo: 'git', host: 'github.com', path: 'schacon/ticgit.git' }
GitCloneUrl.parse(https_url)
#=> {scheme: 'https', host: 'github.com', path: '/schacon/ticgit.git'}
GitCloneUrl.parse(https_url_with_userinfo)
#=> {scheme: 'https', userinfo: 'user:pass', user: 'user', password: 'pass',
# host: 'github.com', path: '/schacon/ticgit.git'}
