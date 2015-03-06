require 'uri'
require 'uri/ssh_git'

require 'git_clone_url/version'

module GitCloneUrl
  class << self
    def parse(url)
      ssh_git_url?(url) ? URI::SshGit.parse(url) : URI.parse(url)
    end

    def ssh_git_url?(url)
      !generic_url?(url)
    end

    def generic_url?(url)
      match = %r{\A(\w*)://}.match(url)
      !!match
    end
  end
end
