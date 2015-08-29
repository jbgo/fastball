class Pitstop::HashDot

  def initialize(hash={})
    @hash = {}

    hash.map do |k, v|
      @hash[k.to_s] = if v.kind_of?(Hash)
        self.class.new v
      else
        @hash[k.to_s] = v
      end
    end
  end

  private

  def method_missing(method_name, *args, &block)
    @hash[method_name.to_s] || super
  end

  def respond_to_missing?(method_name, include_private=false)
    @hash.key?(method_name.to_s) || super
  end

end
