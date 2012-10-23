require 'rake'
require 'erb'

FILES_DOC = %w[Rakefile README.rdoc LICENSE]
DOMAINS = %w[ruby vim git]
FILES_RUBY = %w[gemrc irbrc pryrc railsrc rdebugrc rails ruby rake_completion]
FILES_VIM = %w[vimrc.before vimrc.after gvimrc.after]
FILES_GIT = %w[gitconfig gitignore gitk]

desc "install the dot files into user's home directory"
task :install do
  
  DOMAINS.each do |domain|
    puts "Do you want the #{domain} juice?"
    value = $stdin.gets.chomp
    instance_variable_set("@#{domain}", value)
  end
  
  replace_all = false
  
  Dir['*'].each do |file|
    next if FILES_DOC.include? file
    
    DOMAINS.each do |domain|
      value = instance_variable_get("@#{domain}")
      puts "processing value for #{domain}: #{value}"
      if value == 'n' || value == 'N'
        next if Kernel.const_get("FILES_#{domain.upcase}").include? file      
      end
    end
    
    if File.exist?(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
        puts "identical ~/.#{file.sub('.erb', '')}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub('.erb', '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub('.erb', '')}"
        end
      end
    else
      link_file(file)
    end
  end
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub('.erb', '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end
