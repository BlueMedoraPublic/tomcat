#
# Cookbook:: tomcat
# Recipe:: default
#
# Copyright:: 2010-2016, Chef Software, Inc.
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

user node[:tomcat][:tomcat_user] do
  shell node[:tomcat][:tomcat_user_shell]
  action :create
end

group node[:tomcat][:tomcat_group] do
  members node[:tomcat][:tomcat_user]
  action :create
end

tomcat_install node[:tomcat][:instance_name] do
  version node[:tomcat][:version]
  verify_checksum node[:tomcat][:verify_checksum]
  tarball_path node[:tomcat][:tarball_path]
  tomcat_user node[:tomcat][:tomcat_user]
  tomcat_group node[:tomcat][:tomcat_group]
end

tomcat_service node[:tomcat][:instance_name] do
  action [:start, :enable]
  tomcat_user node[:tomcat][:tomcat_user]
  tomcat_group node[:tomcat][:tomcat_group]
  env_vars node[:tomcat][:env_vars]
end
