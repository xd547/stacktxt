require "version"

module ApplicationHelper
  def version
    Stacktxt::VERSION::STRING
  end
end
