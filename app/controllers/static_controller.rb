class StaticController < ApplicationController

  def notfound
    render( :status => "404 Not Found" )
  end
end
