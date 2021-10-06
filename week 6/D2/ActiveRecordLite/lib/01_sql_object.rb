require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # include col names    HATES STRING INTERP
    cols = DBConnection.execute2(<<-SQL)
      SELECT *
      FROM #{table_name}
      LIMIT 0
    SQL
    # returns array: col_name_str, hashes
    cols.first.map(&:to_sym)
  end

  def self.finalize!
  end

  def self.table_name=(value)
    @table_name = value
  end

  def self.table_name
    # creates table; not instance method
    @table_name ||= self.name.tableize
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
  end

  def attributes
    # ...
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
