local dap = require 'dap'

dap.adapters.go = {
  type = 'executable',
  command = 'dlv',
  args = { 'dap' },
}

dap.configurations.go = {
  {
    type = 'go',
    name = 'Debug main.go with ENV',
    request = 'launch',
    program = '${workspaceFolder}/cmd/api',
    env = {
      FLYWAY_URL = 'jdbc:postgresql://postgres-tiss:5432/tiss',
      FLYWAY_USER = 'user',
      FLYWAY_PASSWORD = 'pass',
      FLYWAY_LOCATIONS = 'filesystem:/flyway/sql/local',
      FLYWAY_SCHEMAS = 'public',
      FLYWAY_DATABASE = 'tiss',
      FLYWAY_MIXED = 'true',
      DB_SOURCE = 'postgresql://user:pass@localhost:5435/tiss',
      AWS_ENDPOINT_URL = 'http://localhost:4566',
      S3_BUCKET_NAME = 'local-tiss',
      SQS_QUEUE_NAME = 'tiss-incoming.fifo',
      LOG_LEVEL = 'info',
      DB_DRIVER = 'postgresql',
      SERVER_ADDRESS = '0.0.0.0:8080',
      TOKEN_SYMMETRIC_KEY = '12345678901234567890123456789012',
      ACCESS_TOKEN_DURATION = '8h',
      NETWORK_MODE = 'bridge',
    },
  },
}
