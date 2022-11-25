module Nxt
  module Admin
    module Errors
      class UserIsNotAdmin < StandardError; end
      class ForbiddenCreateAdmin < StandardError; end
    end
  end
end