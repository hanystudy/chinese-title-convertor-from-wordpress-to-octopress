require 'ruby-pinyin'

class Convertor
	def run(dir)
		new_filename_list = convert(dir)
		rename(new_filename_list)		
	end

	def rename(new_filename_list)
		new_filename_list.each do |filename|
			File.rename(absolute_path(dir, filename[:filename]), absolute_path(dir, filename[:new_filename]))
		end 
	end

	def extract_title(file)
		title = 'unknown-title'
		File.open file do |f|
			while line = f.gets do
				if line =~ /\Atitle:.*\Z/
					title = line.gsub(/\Atitle:\s*/, '')
					break
				end
			end
		end
		title
	end

	def convert(dir)
		files = retrive_dir(dir)
		files.inject([]) do |list, filename|
			list << transform_filename(list, dir, filename) if filename =~ /([^\.-]+)(%)/
		end
	end

	private
	def pinyin(chinese)
		pinyin = PinYin.of_string(chinese)
		pinyin.join('-')
	end

	def retrive_dir(dir)
		Dir.entries(dir)
	end

	def exist(list, new_filename)
		list.any? { |key, name| key == :new_filename && name == new_filename}
	end

	def absolute_path(dir, filename)
		"#{dir}/#{filename}"
	end

	def transform_filename(list, dir, filename)
		temp_filename = filename.gsub(/([^\.-]*)(%[^.]*)/, pinyin(extract_title("#{dir}/#{filename}")))
		new_filename = temp_filename
		index = 0
		while exist(list, new_filename) do
			index += 1
			new_filename = "#{temp_filename}-#{index}"
		end
		{filename: filename, new_filename: new_filename}
	end
end