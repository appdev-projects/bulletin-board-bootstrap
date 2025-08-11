class ListingsController < ApplicationController
  def create
    the_listing = Listing.new
    the_listing.title = params.fetch("query_title")
    the_listing.body = params.fetch("query_body")
    the_listing.expires_on = params.fetch("query_expires_on")
    the_listing.board_id = params.fetch("query_board_id")

    if the_listing.valid?
      the_listing.save
      redirect_to("/boards/#{the_listing.board_id}", { :notice => "Listing created successfully." })
    else
      redirect_to("/boards/#{the_listing.board_id}", { :alert => the_listing.errors.full_messages.to_sentence })
    end
  end
end
