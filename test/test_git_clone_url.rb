require_relative 'helper'

module GitCloneUrl
  class TestGitCloneUrl < Test::Unit::TestCase
    test 'version' do
      assert do
        !::GitCloneUrl::VERSION.nil?
      end
    end
    git_url = 'git://github.com/schacon/ticgit.git'
    ssh_url = 'git@github.com:schacon/ticgit.git'
    https_url = 'https://github.com/schacon/ticgit.git'
    https_url_with_userinfo = 'https://user:pass@github.com/schacon/ticgit.git'

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
  end
end
