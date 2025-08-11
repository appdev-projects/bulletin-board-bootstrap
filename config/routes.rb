Rails.application.routes.draw do
  get("/", { :controller => "boards", :action => "index" })

  # Routes for the Listing resource:

  # CREATE
  post("/insert_listing", { :controller => "listings", :action => "create" })

  # DELETE
  get("/delete_listing/:path_id", { :controller => "listings", :action => "destroy" })

  #------------------------------

  # Routes for the Board resource:

  # CREATE
  post("/insert_board", { :controller => "boards", :action => "create" })

  # READ
  get("/boards", { :controller => "boards", :action => "index" })

  get("/boards/:path_id", { :controller => "boards", :action => "show" })

  #------------------------------
end
