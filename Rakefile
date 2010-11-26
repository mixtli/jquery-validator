require 'rubygems'
require 'rake'

begin
  require 'jeweler'
#  require 'jruby-openssl'
  Jeweler::Tasks.new do |gem|
    gem.name = "jquery-validator"
    gem.summary = %Q{DRY up your rails validations with jquery}
    gem.description = %Q{Uses the model validation logic you have already defined to generate javascript validation using jquery}
    gem.email = "ronmcclain75@gmail.com"
    gem.homepage = "http://github.com/mixtli/jquery-validator"
    gem.authors = ["mixtli"]
    gem.add_development_dependency "rspec", ">= 1.2.9"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

#require 'spec/rake/spectask'
#Spec::Rake::SpecTask.new(:spec) do |spec|
#  spec.libs << 'lib' << 'spec'
#  spec.spec_files = FileList['spec/**/*_spec.rb']
#end

#Spec::Rake::SpecTask.new(:rcov) do |spec|
#  spec.libs << 'lib' << 'spec'
#  spec.pattern = 'spec/**/*_spec.rb'
#  spec.rcov = true
#end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "jquery-validator #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
