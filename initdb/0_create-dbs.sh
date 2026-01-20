#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
  -- Create n8n database and user
  CREATE USER n8n_user WITH PASSWORD 'n8n_password';
  CREATE DATABASE n8n OWNER n8n_user;
  GRANT ALL PRIVILEGES ON DATABASE n8n TO n8n_user;
  
  -- Create Jira database and user
  CREATE USER jira_user WITH PASSWORD 'jira_password';
  CREATE DATABASE jiradb OWNER jira_user;
  GRANT ALL PRIVILEGES ON DATABASE jiradb TO jira_user;
  
  -- Create Confluence database and user
  CREATE USER confluence_user WITH PASSWORD 'confluence_password';
  CREATE DATABASE confluencedb OWNER confluence_user;
  GRANT ALL PRIVILEGES ON DATABASE confluencedb TO confluence_user;
EOSQL