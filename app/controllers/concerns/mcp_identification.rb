module McpIdentification
  extend ActiveSupport::Concern

  included do
    before_action :set_mcp_ids, if: :mcp_request?
  end

  private
    def set_mcp_ids
      response.headers["X-MCP-Request-ID"] = mcp_request_id
      response.headers["X-MCP-Server-ID"]  = mcp_server_id
    end

    def mcp_request?
      mcp_request_id.present?
    end

    def mcp_request_id
      request.headers["X-MCP-Request-ID"] || "mcp-req-#{SecureRandom.hex(10)}"
    end

    def mcp_server_id
      ENV["MCP_SERVER_ID"] || "mcp-server-#{SecureRandom.hex(4)}"
    end
end
