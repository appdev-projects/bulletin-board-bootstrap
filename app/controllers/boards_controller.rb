class BoardsController < ApplicationController
  def index
    matching_boards = Board.all

    @list_of_boards = matching_boards.order({ :created_at => :desc })

    render({ :template => "board_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_boards = Board.where({ :id => the_id })

    @the_board = matching_boards.at(0)

    @matching_listings = @the_board.listings

    @active_listings = @matching_listings.where({ :expires_on => (Time.current...) }).order(:expires_on)

    @expired_listings = @matching_listings.where.not({ :expires_on => (Time.current...) }).order({ :expires_on => :desc })

    render({ :template => "board_templates/show" })
  end

  def create
    the_board = Board.new
    the_board.name = params.fetch("query_name")

    if the_board.valid?
      the_board.save
      redirect_to("/boards/#{the_board.id}", { :notice => "Board created successfully." })
    else
      redirect_to("/boards", { :alert => the_board.errors.full_messages.to_sentence })
    end
  end
end
