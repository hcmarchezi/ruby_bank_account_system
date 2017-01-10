Dir.glob('lib/**').reject { |file_path| File.directory? file_path }.each do |file|
	require file
end
