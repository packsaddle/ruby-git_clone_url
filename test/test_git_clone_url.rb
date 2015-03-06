require_relative 'helper'

module GitCloneUrl
  class TestGitCloneUrl < Test::Unit::TestCase
    test 'version' do
      assert do
        !::GitCloneUrl::VERSION.nil?
      end
    end
  end
end
