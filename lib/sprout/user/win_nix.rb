
module Sprout::User

  # The concrete user for Cygwin and Mingw
  # We can't quite treat these users like
  # a typical *nix user, but we can't quite
  # treat them like Windows users either.
  #
  # One great thing about these users,
  # is that we get to use real processes,
  # rather than the broken processes that
  # windows normally offers.
  class WinNix < Win
  end
end
