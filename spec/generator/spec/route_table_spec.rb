# frozen_string_literal: true

require 'spec_helper'

describe 'Awspec::Generator::Spec::RouteTable' do
  before do
    Awspec::Stub.load 'route_table'
  end
  let(:route_table) { Awspec::Generator::Spec::RouteTable.new }
  it 'generate_by_vpc_id generate spec' do
    spec = <<-'EOF'
describe route_table('my-route-table') do
  it { should exist }
  it { should belong_to_vpc('my-vpc') }
  it { should have_route('10.0.0.0/16').target(gateway: 'local') }
  it { should have_route('0.0.0.0/0').target(gateway: 'igw-1ab2345c') }
  it { should have_route('192.168.1.0/24').target(instance: 'my-ec2') }
  it { should have_route('192.168.2.0/24').target(vpc_peering_connection: 'my-pcx') }
  it { should have_route('192.168.3.0/24').target(nat: 'nat-7ff7777f') }
  it { should have_route('pl-1a2b3c4d').target(gateway: 'vpce-11bb22cc') }
  it { should have_subnet('my-subnet') }
end
EOF
    expect(route_table.generate_by_vpc_id('my-vpc').to_s.gsub(/\n/, "\n")).to eq spec
  end
end
