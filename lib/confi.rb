require "yaml"

module Confi
  extend self

  def configure(source = {})
    source.each { |key, value| accessors(key, value) }
    yield self if block_given?
  end

  private

  def dump
    res = {}
    @keys.uniq.each { |key| res[key] = send(key) }
    res
  end

  def accessors(key, value)
    @keys ||= []
    @keys << key.to_sym
    name = key.to_s
    writer = "#{name}="
    var_name = "@AWE_#{name}"

    self.class.class_eval <<-RUBY, __FILE__, __LINE__ + 1
      def #{name};     #{var_name}; end
      def #{name}=(x); #{var_name} = x; end
    RUBY
    send(writer, value)
  end

  def method_missing(method_name, *args)
    if method_name.end_with?("=")
      name = method_name[0..-2]
      accessors(name, args.first)
    else
      super
    end
    nil
  end

  def respond_to_missing?(method_name, include_private = false)
    method_name.end_with?("=") || super
  end
end
