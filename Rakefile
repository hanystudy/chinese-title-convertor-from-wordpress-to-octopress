require 'rake'

namespace :test do
	desc 'run tests'
	task :default => [:unit] do
	end

	desc 'run unit tests'
	task :unit do
		sh 'ruby test/run_test.rb'
	end
end

desc 'run with rake run["~/website/hanystudy.github.io/source/_posts"]'
task :default => [:path] do |task, args|
	convertor = Convertor.new
	convertor.run(args[:path])
end


task :default => %w(test:default)