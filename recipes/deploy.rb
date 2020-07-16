#nabijem Chef na kurac 14.04.2020
package 'nodejs'

app = search(:aws_opsworks_app).first
app_path = "/srv/#{app['shortname']}"

application app_path do
  javascript node["nodejs"]["version"]
  environment.update("PORT" => "80")
  environment.update(app["environment"])
  user 'root'

  git app_path do
    user 'root'
    deploy_key app['app_source']['ssh_key']
    repository app["app_source"]["url"]
    revision app["app_source"]["revision"]
  end

  npm_install do
    user 'root'
    retries 3
    retry_delay 10
  end

  execute 'build nuxt' do
    user 'root'
    cwd app_path
    command 'npm run build'
  end 

  execute 'start server' do
    user 'root'
    cwd app_path
    command 'pm2 start npm -- start'
  end
end

 

  
