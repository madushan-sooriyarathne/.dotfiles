#!/bin/bash

# Add MCP servers to Claude configuration

echo "Adding filesystem MCP server..."
claude mcp add filesystem -s user -- bunx -y @modelcontextprotocol/server-filesystem ~/Developer

echo "Adding sequential-thinking MCP server..."
claude mcp add sequential-thinking -s user -- bunx -y @modelcontextprotocol/server-sequential-thinking

echo "Adding Ref MCP server..."
claude mcp add --transport http Ref -s user "https://api.ref.tools/mcp?apiKey=ref-503278a674d4154d82d2"

echo "Adding Semgrep MCP server..."
claude mcp add --transport http semgrep -s user "https://mcp.semgrep.ai/mcp"

echo "Adding Playwright MCP server..."
claude mcp add playwright -s user -- bunx -y @playwright/mcp@latest

echo "Adding browser-use MCP server..."
claude mcp add browser-use -s user -- bunx -y @agent-infra/mcp-server-browser@latest

echo "All MCP servers have been added successfully!"

