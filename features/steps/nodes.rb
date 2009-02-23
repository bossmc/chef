#
# Author:: Adam Jacob (<adam@opscode.com>)
# Copyright:: Copyright (c) 2008 Opscode, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

###
# Given
###
Given /^a validated node$/ do
  @client.validation_token = Chef::Config[:validation_token] = 'ceelo'
  @client.build_node
  @client.node.recipes = "integration_setup"
  @client.register
  @client.authenticate
end

Given /^it includes the recipe '(.+)'$/ do |recipe|
  @client.node.recipes << recipe
  @client.save_node
end

###
# When
###
When /^the node is converged$/ do
  @client.run
end

