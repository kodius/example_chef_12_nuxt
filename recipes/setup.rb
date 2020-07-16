#nabijem Chef na kurac 14.04.2020
package 'nodejs'

package "git" do
  options "--force-yes" if node["platform"] == "ubuntu" && node["platform_version"] == "18.04"
end

execute 'install nuxt' do
  user 'root'
  command 'npm install nuxt@2.12.1 --global'
end

execute 'install pm2' do
  user 'root'
  command 'npm install pm2@3.4.1 --global'
end

link "/usr/bin/pm2" do
  to "/usr/local/nodejs-binary-#{node["nodejs"]["version"]}/bin/pm2"
end

