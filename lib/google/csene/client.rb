module Google
  module Csene
    class Client
      TOKEN_CREDENTIAL_URI = 'https://accounts.google.com/o/oauth2/token'
      AUDIENCE = 'https://accounts.google.com/o/oauth2/token'
      SCOPE = 'https://www.googleapis.com/auth/cse'

      def initialize(application_name: 'google-csene',
                     application_version: '1.0',
                     api_key:,
                     cse_id:)
        @application_name = application_name
        @application_version = application_version
        @api_key = api_key
        @cse_id = cse_id
      end

      def client
        @client ||= Google::APIClient.new(
          application_name: @application_name,
          application_version: @application_version,
          authorization: nil
        )
      end

      def page_rank(site, link, page = 1)
        start = (page - 1) * 10 + 1
        result = client.execute(
          service.cse.list,
          default_options.merge(
            'start' => start,
            'q' => site
          )
        )
        queries = result.data.queries
        has_next_page = !queries.nil? && queries['nextPage'].count > 0
        has_result = result.data.items.count > 0

        return 0 unless has_result

        result.data.items.each_with_index do |item, i|
          # puts "start: #{start}, i: #{i} rank: #{start + i}, query: #{site}, link: #{item.link}"
          if item.link =~ link
            return start + i
          elsif item.link == link
            return start + i
          end
        end

        page_rank(site, link, page + 1) if has_next_page
      end

      def index_count(site)
        result = client.execute(
          service.cse.list,
          default_options.merge(
            'q' => "site:#{site}"
          )
        )

        result.data.search_information.total_results
      end

      # seems working for the moment (maybe Google has stopped providing this?)
      def backlink_count(site)
        result = client.execute(
          service.cse.list,
          default_options.merge(
            'q' => "link:#{site}"
          )
        )

        result.data.search_information.total_results
      end

      private

      def default_options
        {
          'key' => @api_key,
          'cx' => @cse_id
        }
      end

      def service
        client.discovered_api('customsearch')
      end
    end
  end
end
