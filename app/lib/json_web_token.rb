class JsonWebToken
  def self.decode(token)
    JWT.decode(token, 'EMMANUEL')[0]
  end
end
