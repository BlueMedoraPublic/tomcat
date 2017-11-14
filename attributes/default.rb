default[:tomcat][:version] = '9.0.1'
default[:tomcat][:instance_name] = "tomcat-#{node[:tomcat][:version]}"
default[:tomcat][:install_path] = "/usr/local/tomcat/#{node[:tomcat][:instance_name]}"
default[:tomcat][:tarball_base_uri] = 'http://archive.apache.org/dist/tomcat/'
default[:tomcat][:checksum_base_uri] = 'http://archive.apache.org/dist/tomcat/'
default[:tomcat][:verify_checksum] = true
default[:tomcat][:dir_mode] = '0750'
default[:tomcat][:tarball_uri] = ''
default[:tomcat][:tarball_path] = "#{Chef::Config[:file_cache_path]}/#{node[:tomcat][:instance_name]}.tar.gz"
default[:tomcat][:exclude_docs] = false
default[:tomcat][:exclude_examples] = false
default[:tomcat][:exclude_manager] = false
default[:tomcat][:exclude_hostmanager] = false
default[:tomcat][:tomcat_user] = 'tomcat'
default[:tomcat][:tomcat_group] = 'tomcat'
default[:tomcat][:tomcat_user_shell] = '/bin/false'
default[:tomcat][:env_vars] = [ {'CATALINA_BASE' => "#{node[:tomcat][:install_path]}"}, {'CATALINA_PID' => '$CATALINA_BASE/bin/tomcat.pid'} ]
default[:tomcat][:sensitive] = false
