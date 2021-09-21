class Employee
  attr_reader :name, :title, :salary, :boss
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    unless boss.nil?
      bigger_boss = boss
      until bigger_boss.nil?
        bigger_boss.subordinates << self unless bigger_boss.subordinates.include?(self)
        bigger_boss = bigger_boss.boss
      end
    end
  end

  def bonus(multiplier)
    self.salary * multiplier
  end
end

class Manager < Employee
  attr_accessor :subordinates
  def initialize(name, title, salary, boss, subordinates = [])
    super(name, title, salary, boss)
    @subordinates = subordinates
  end

  def bonus(multiplier)
    @subordinates.map(&:salary).sum * multiplier
  end
end