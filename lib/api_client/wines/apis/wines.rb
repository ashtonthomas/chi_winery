module ApiClient
  class Wines
    def self.get
      binding.pry
      WinesComponent::Wines.get
    end
  end
end