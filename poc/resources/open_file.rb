resource_name :open_files
property :usr, kind_of: String, name_property: true
property :type, kind_of: String, name_property: true
property :value, kind_of: String, name_property: true

action :create do
 execute 'setting open file limit' do
command <<-EOH
echo "#{usr} #{type} nofile #{value}" >> /etc/security/limits.conf
EOH
not_if "cat /etc/security/limits.conf | grep '#{usr} #{type} nofile #{value}'"
end
end
