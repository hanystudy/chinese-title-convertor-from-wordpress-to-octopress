base_dir = File.expand_path(File.join(File.dirname(__FILE__), ".."))
lib_dir  = File.join(base_dir, "lib")
src_dir  = File.join(base_dir, "src")
test_dir = File.join(base_dir, "test")

$LOAD_PATH.unshift(lib_dir)

require 'test/unit'
require "mocha/test_unit"

exit Test::Unit::AutoRunner.run(true, test_dir)