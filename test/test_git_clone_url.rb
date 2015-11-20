require_relative 'helper'

module GitCloneUrl
  class TestGitCloneUrl < Test::Unit::TestCase
    test 'version' do
      assert do
        !::GitCloneUrl::VERSION.nil?
      end
    end
  end

  class TestGitUrl < Test::Unit::TestCase
    git_url = 'git://github.com/schacon/ticgit.git'
    sub_test_case 'git://' do
      test 'generic_url?' do
        assert do
          ::GitCloneUrl.generic_url?(git_url)
        end
      end
      test 'ssh_git_url?' do
        assert do
          !::GitCloneUrl.ssh_git_url?(git_url)
        end
      end
    end
    sub_test_case '.parse git_url' do
      test 'git_url scheme' do
        assert do
          ::GitCloneUrl.parse(git_url).scheme == 'git'
        end
      end
      test 'git_url host' do
        assert do
          ::GitCloneUrl.parse(git_url).host == 'github.com'
        end
      end
      test 'git_url path' do
        assert do
          ::GitCloneUrl.parse(git_url).path == '/schacon/ticgit.git'
        end
      end
    end
  end

  class TestSshUrl < Test::Unit::TestCase
    ssh_url = 'git@github.com:schacon/ticgit.git'
    sub_test_case 'git@' do
      test 'generic_url?' do
        assert do
          !::GitCloneUrl.generic_url?(ssh_url)
        end
      end
      test 'ssh_git_url?' do
        assert do
          ::GitCloneUrl.ssh_git_url?(ssh_url)
        end
      end
    end
    sub_test_case '.parse ssh_url' do
      test 'ssh_url scheme' do
        assert do
          ::GitCloneUrl.parse(ssh_url).scheme.nil?
        end
      end
      test 'ssh_url user' do
        assert do
          ::GitCloneUrl.parse(ssh_url).user == 'git'
        end
      end
      test 'ssh_url password' do
        assert do
          ::GitCloneUrl.parse(ssh_url).password.nil?
        end
      end
      test 'ssh_url userinfo' do
        assert do
          ::GitCloneUrl.parse(ssh_url).userinfo == 'git'
        end
      end
      test 'ssh_url host' do
        assert do
          ::GitCloneUrl.parse(ssh_url).host == 'github.com'
        end
      end
      test 'ssh_url path' do
        assert do
          ::GitCloneUrl.parse(ssh_url).path == '/schacon/ticgit.git'
        end
      end
    end
  end

  class TestHttpsUrl < Test::Unit::TestCase
    https_url = 'https://github.com/schacon/ticgit.git'
    sub_test_case 'https://' do
      test 'generic_url?' do
        assert do
          ::GitCloneUrl.generic_url?(https_url)
        end
      end
      test 'ssh_git_url?' do
        assert do
          !::GitCloneUrl.ssh_git_url?(https_url)
        end
      end
    end
    sub_test_case '.parse https_url' do
      test 'https_url scheme' do
        assert do
          ::GitCloneUrl.parse(https_url).scheme == 'https'
        end
      end
      test 'https_url host' do
        assert do
          ::GitCloneUrl.parse(https_url).host == 'github.com'
        end
      end
      test 'https_url path' do
        assert do
          ::GitCloneUrl.parse(https_url).path == '/schacon/ticgit.git'
        end
      end
    end
  end

  class TestHttpsUserinfoUrl < Test::Unit::TestCase
    https_url_with_userinfo = 'https://user:pass@github.com/schacon/ticgit.git'
    sub_test_case 'https://userinfo@' do
      test 'generic_url?' do
        assert do
          ::GitCloneUrl.generic_url?(https_url_with_userinfo)
        end
      end
      test 'ssh_git_url?' do
        assert do
          !::GitCloneUrl.ssh_git_url?(https_url_with_userinfo)
        end
      end
    end
    sub_test_case '.parse https_url_with_userinfo' do
      test 'https_url_i scheme' do
        assert do
          ::GitCloneUrl.parse(https_url_with_userinfo).scheme == 'https'
        end
      end
      test 'https_url_i host' do
        assert do
          ::GitCloneUrl.parse(https_url_with_userinfo).host == 'github.com'
        end
      end
      test 'https_url_i path' do
        assert do
          ::GitCloneUrl.parse(https_url_with_userinfo).path == '/schacon/ticgit.git'
        end
      end
      test 'https_url_i userinfo' do
        assert do
          ::GitCloneUrl.parse(https_url_with_userinfo).userinfo == 'user:pass'
        end
      end
      test 'https_url_i user' do
        assert do
          ::GitCloneUrl.parse(https_url_with_userinfo).user == 'user'
        end
      end
      test 'https_url_i password' do
        assert do
          ::GitCloneUrl.parse(https_url_with_userinfo).password == 'pass'
        end
      end
    end
  end
end
