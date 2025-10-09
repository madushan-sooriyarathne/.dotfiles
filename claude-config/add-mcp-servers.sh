#!/bin/bash

# Add MCP servers to Claude configuration

echo "Adding filesystem MCP server..."
claude mcp add filesystem -s user -- bunx -y @modelcontextprotocol/server-filesystem ~/Developer

echo "Adding sequential-thinking MCP server..."
claude mcp add sequential-thinking -s user -- bunx -y @modelcontextprotocol/server-sequential-thinking

echo "Adding Ref MCP server..."
claude mcp add --transport http Ref -s user "https://api.ref.tools/mcp?apiKey=ref-503278a674d4154d82d2"

echo "Adding Playwright MCP server..."
claude mcp add playwright -s user -- bunx -y @playwright/mcp@latest

echo "Adding browser MCP..."
claude mcp add browser-mcp -s user -- bunx -y @browsermcp/mcp@latest

echo "Adding Figma Dev MCP..."
claude mcp add figma -s user -- bunx -y figma-developer-mcp --figma-api-key=<FIGMA_API_KEY> --stdio

echo "All MCP servers have been added successfully!"
