module ApiSpecHelper
  def json
    JSON.parse(response.body)
  end

  def authenticate_user(user)
    token = JsonWebToken.encode(id: user.id, email: user.email)
    { 'Authorization': "Bearer #{token}" }
  end

  def validate_api_error(response, status, code)
    expect(response.status).to eq(status)
    expect(json_errors['code']).to eq(code)
  end

  def json_data
    json['data']
  end

  def json_errors
    json['errors']
  end
end
