require 'uri'
require 'uri/ssh_git'

require 'git_clone_url/version'

module GitCloneUrl
  # Git clone url
  class << self
    # @param url [String] git repository-ish url
    #
    # @return [URI::Generic] if url starts ssh
    # @return [URI::HTTPS] if url starts https
    # @return [URI::SshGit] if url is ssh+git e.g git@example.com:schacon/ticgit.git
    def parse(url)
      ssh_git_url?(url) ? URI::SshGit.parse(url) : URI.parse(url)
    end

    # @param url [String] git repository-ish url
    #
    # @return [Boolean] true if url is git via ssh protocol
    def ssh_git_url?(url)
      !generic_url?(url)
    end

    # @param url [String] git repository-ish url
    #
    # @return [Boolean] true if url is https, ssh protocol
    def generic_url?(url)
      match = %r{\A(\w*)://}.match(url)
      !match.nil?
    end
  end
end
