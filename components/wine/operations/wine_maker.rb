class WineMaker
  def initialize(name: 'name', vintage: 2015)
    @name = name
    @vintage = vintage
  end

  def call
    "#{@name} (#{@vintage})"
  end
end