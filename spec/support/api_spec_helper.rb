module ApiSpecHelper
  def json
    JSON.parse(response.body)
  end

  def authenticate_user(user)
    token = JsonWebToken.encode(id: user.id, email: user.email)
    { 'Authorization': "Bearer #{token}" }
  end
end
