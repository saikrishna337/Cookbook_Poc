resource_name :max_process
property :usr, kind_of: String, name_property: true
property :type, kind_of: String, name_property: true
property :value, kind_of: String, name_property: true

action :create do
 execute 'setting processes and file open limit' do
command <<-EOH
echo "#{usr} #{type} nproc #{value}" >> /etc/security/limits.conf
echo "#{usr} #{type} #{value}" > /tmp/out
EOH
not_if "cat /etc/security/limits.conf | grep '#{usr} #{type} nproc #{value}'"
end
end

