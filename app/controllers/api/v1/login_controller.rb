class Api::V1::LoginController < ApplicationController

  def create
    query_params = {
      client_id: ENV['SPOTIFY_CLIENT_ID'],
      response_type: "code",
      redirect_uri: ENV['SPOTIFY_REDIRECT_URI'],
      scope: "user-read-currently-playing user-read-playback-state user-modify-playback-state user-library-read user-library-modify",
      show_dialog: true
    }

    url = "https://accounts.spotify.com/authorize"

    redirect_to "#{url}?#{query_params.to_query}"
  end
end
