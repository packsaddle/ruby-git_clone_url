require 'git_clone_url/version'

module GitCloneUrl
  class << self
    def parse(_url)
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
