class ProfilesController < ApplicationController
  def index
    # @users = users
    search_query = params[:query]
    query = User.ransack(username_cont: search_query)
    @users = query.result(distince: true)
  end

  # def users
  #   search_query = params[:query]
  #   query = User.ransack(username_cont: search_query)
  #   @users = query.result(distince: true)
  # end

  # def search_query
  #   params[:query]
  # end
end
