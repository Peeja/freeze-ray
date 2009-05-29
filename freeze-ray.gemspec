# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{freeze-ray}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Peter Jaros"]
  s.date = %q{2009-05-29}
  s.description = %q{Fixes ActiveRecord's dirty tracking.  Provides an attr_frozen macro which causes an attribute to be returned frozen.}
  s.email = %q{peter.a.jaros@gmail.com}
  s.files = ["History.txt", "README.markdown", "VERSION.yml", "lib/freeze_ray.rb", "spec/freeze_ray_spec.rb"]
  s.has_rdoc = true
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Fixes ActiveRecord's dirty tracking.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
