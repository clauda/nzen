# For Tests; Truncate tables
# require 'active_record/base'
# require 'active_record/connection_adapters/abstract_mysql_adapter'

class Truncation

  # ActiveRecord::Base.connection
  def initialize(env = "test")
    @env = env
    @connection = connection
  end

  def connection
    config = ActiveRecord::Base.configurations[@env]
    @connection = ActiveRecord::Base.establish_connection(config).connection
  end

  def truncate!
    execute "TRUNCATE TABLE #{tables.join(',')}"
  end

  private

    def tables
      @tables = @connection.tables - reject_tables
    end

    def reject_tables
      ["schema_migrations", "ar_internal_metadata"]
    end

    def execute(sql, name = nil)
      @connection.query(sql)
    end

end
