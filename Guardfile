# A sample Guardfile
# More info at https://github.com/guard/guard#readme
guard 'rspec', cmd: "bundle exec RAISE_DEPRECATED=true" do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
end

