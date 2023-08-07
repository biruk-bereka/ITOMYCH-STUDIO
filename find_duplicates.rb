require 'digest'
require 'find'

def find_duplicate_files(directory)
  content_hashes = {}
  duplicates = {}

  Find.find(directory) do |path|
    next if File.directory?(path)

    content_hash = Digest::SHA256.file(path).hexdigest

    if content_hashes.key?(content_hash)
      duplicates[content_hash] ||= []
      duplicates[content_hash] << path
    else
      content_hashes[content_hash] = path
    end
  end

  duplicates
end

# Please change the directory_to_search to your directory
directory_to_search = File.join(Dir.home, 'directory_to_search') 
duplicate_files = find_duplicate_files(directory_to_search)


duplicate_files.each do |content_hash, paths|
  puts "Duplicate files with hash #{content_hash}:"
  paths.each { |path| puts "- #{path}" }
end