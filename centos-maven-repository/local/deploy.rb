#!/usr/bin/env ruby

URL='scp://192.168.151.5/var/www/maven2'
MVN='/usr/local/Cellar/maven2/2.2.1/bin/mvn'

def parse_options(args)
  require 'optparse'
  options = {}
  OptionParser.new do |opts|
    opts.on("-g", "--groupid groupid", "Mandatory groupid") do |groupid|
      options[:groupid] = groupid
    end
    opts.on("-a", "--artifactid [artifactid]", "Artifactid") do |artifactid|
      options[:artifactid] = artifactid
    end
    opts.on("-v", "--version [version]", "Version") do |version|
      options[:version] = version
    end
    opts.on("-c", "--classifier [classifier]", "Classifier") do |classifier|
      options[:classifier] = classifier
    end
  end.parse!(args)
  options
end

def usage
  fail "Usage #{File.basename(__FILE__)} [opts] --groupid <groupId> <file>"
end

options = parse_options(ARGV)
file = ARGV.first

usage if options[:groupid].nil?
usage unless File.exist?(file) 

if options[:version].nil?
  options[:version] = File.basename(file).sub(/[^0-9]+-(\d.*).jar/, '\1')
end

if options[:artifactid].nil?
  options[:artifactid] = File.basename(file).sub(/([^0-9]+)-\d.*/, '\1')
end

command="#{MVN} deploy:deploy-file -Dfile=#{file} -DgroupId=#{options[:groupid]} -DartifactId=#{options[:artifactid]}"
command << " -DrepositoryId=centos-repository -Dversion=#{options[:version]} -Dpackaging=jar -Durl=#{URL}"
command << " -Dclassifier=#{options[:classifier]}" if options[:classifier]
system command
