require_relative '../src/convertor'

class TestConvertor < Test::Unit::TestCase
  def setup
  	@convertor = Convertor.new
  end

  def test_convert
  	Dir.expects(:entries).with('test').returns(['2015-%123123%'])
  	Convertor.any_instance.stubs(:extract_title).returns('呵呵')
  	result = @convertor.convert('test')
  	assert_equal(result.count, 1, "Should have only one item")
  	assert_equal(result[0][:new_filename], '2015-he-he', "Should convert chinese to pinyin")
  end

  def teardown
  end
end