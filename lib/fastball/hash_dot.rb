module Fastball

  # A utility class to allow referencing nested hash values as chained method calls.
  #
  # == Example
  #
  #     !!!
  #     ruby> h = Fastball::HashDot.new name: { name: 'Jordan', state: 'Texas' }
  #     ruby> h.contact.name
  #      => "Jordan"
  #     ruby> h.contact.state
  #      => "Texas"
  #
  class HashDot

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
end
