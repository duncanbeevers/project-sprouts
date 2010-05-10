
module Sprout::User

  class OSXUser < UnixUser
    LIBRARY = 'Library'

    def library
      lib = File.join(home, LIBRARY)
      if(File.exists?(lib))
        return lib
      else
        return super
      end
    end

    def format_application_name(name)
      return name.capitalize
    end

    def can_execute? platform
      platform == :mac || platform == :osx || platform == :macosx || platform == :darwin || super
    end

  end
end

