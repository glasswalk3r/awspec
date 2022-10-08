# frozen_string_literal: true

require 'spec_helper'
Awspec::Stub.load 'elasticache'

describe elasticache('my-rep-group-001') do
  it { should exist }
  it { should be_available }
  it { should have_cache_parameter_group('my-cache-parameter-group') }
  it { should belong_to_replication_group('my-rep-group') }
  it { should belong_to_cache_subnet_group('my-cache-subnet-group') }
  it { should belong_to_vpc('my-vpc') }
  it { should have_security_group('sg-da1bc2ef') }
  it { should have_security_group('group-name-sg') }
  it { should have_security_group('my-cache-sg') }
end
