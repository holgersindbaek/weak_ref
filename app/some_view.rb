class SomeView < UIView
  def test_method
    p "test_method called!"
  end

  def dealloc
    p "dealloc: #{self}"
    super
  end
end