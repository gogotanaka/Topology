require "pry"
require "set"
class Topology
  attr_accessor :sos # Set of set

  def initialize(set, sub_power)
    fail "#{sub_power.inspect} should subset of #{set.power.inspect}" unless sub_power.subset? set.power
    @sos = if set.top? sub_power
      sub_power
    else
      sub_power << set
      set2 = sub_power.dup
      set3 = sub_power.dup
      sub_power.each do |e|
        set2.delete(e)
        set2.each { |f| set3 << (e & f)  }
      end
      set3
    end
  end

  def top?(x)
    @sos.top?(x)
  end
end

class TopologySpace < Struct.new(:set, :top)
end

class Object
  def set?
    is_a?(Set)
  end
end

class Set
  def power
    (0 .. 2 ** length - 1).map { |n|
      select.with_index { |_, i| (n >> i) & 1 == 1 }.to_set
    }.to_set
  end

  def sos?
    all?(&:set?)
  end

  def top?(x)
    sos? && subset?(x.power) && axiom1? && axiom2? && axiom3?(x)
  end

  def axiom1?
    sos2 = dup
    all? do |e|
      sos2.delete(e)
      sos2.all? { |f| _?(e | f)  }
    end
  end

  def axiom2?
    sos2 = dup
    all? do |e|
      sos2.delete(e)
      sos2.all? { |f| _?(e & f)  }
    end
  end

  def axiom3?(x)
    _?(Set[]) && _?(x)
  end

  alias :_? :include?
end
