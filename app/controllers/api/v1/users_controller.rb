class Api::V1::UsersController < ApplicationController

  def index
    if params[:error]
      puts "LOGIN ERROR", params

      redirect_to "http://localhost:3000/login/failure"
    else
      body = {
        grant_type: "authorization_code",
        code: params[:code],
        redirect_uri: ENV['SPOTIFY_REDIRECT_URI'],
        client_id: ENV['SPOTIFY_CLIENT_ID'],
        client_secret: ENV['SPOTIFY_CLIENT_SECRET']
      }

      auth_response = RestClient.post('https://accounts.spotify.com/api/token', body)

      auth_params = JSON.parse(auth_response.body)

      header = {
        Authorization: "Bearer #{auth_params["access_token"]}"
      }

      user_response = RestClient.get("https://api.spotify.com/v1/me", header)
      user_params = JSON.parse(user_response.body)
      @user = User.find_or_create_by(display_name: user_params["display_name"], username: user_params["id"], spotify_uri: user_params["uri"])
      @user.update(access_token: auth_params["access_token"], refresh_token: auth_params["refresh_token"])
      redirect_to "http://localhost:3000/success"
    end
  end


end
