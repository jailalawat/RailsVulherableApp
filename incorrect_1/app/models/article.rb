class Article < ActiveRecord::Base
  validates :title, :web_url, presence: true, length: { minimum: 5 }

  WHITELISTED_URI_SCHEMES = %w( http https )

  validate :check_uri_scheme

  private
    def check_uri_scheme
      begin
        uri = URI.parse(web_url)
        unless WHITELISTED_URI_SCHEMES.include?(uri.scheme.downcase)
          errors.add :web_url, 'is not an allowed URI scheme'
        end
      rescue URI::InvalidURIError
        errors .add :web_url, 'is not a valid URI'
      end
    end
end
