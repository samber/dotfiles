# .bashrc

################################## IADVIZE  ##################################
#export DO_PAT=""
#export DO_TOKEN=""
#export SSH_FINGERPRINT=$(ssh-keygen -l -E md5 -f ~/.ssh/id_rsa.pub | awk '{print $2}')
#export SSH_FINGERPRINT=""
#alias ikoula="csshX web{1..8} web1ng web2ng es4 es5"
#alias oxalide="csshX www{1..16}"
#export TF_VAR_docker_login=''
#export TF_VAR_aws_access_key=""
#export TF_VAR_aws_secret_key=""
#export TF_VAR_aws_access_key_s3=""
#export TF_VAR_aws_secret_key_s3=""
#export TF_VAR_aws_region="eu-central-1"
#export TF_VAR_do_token=""
#export TF_VAR_do_token=""
#export TF_VAR_provider_aws_region="$TF_VAR_aws_region"
#export TF_VAR_provider_rundeck_auth_token=""
#export TF_VAR_rundeck_auth_token=""
#export TF_VAR_dyn_username="samuel.berthe@iadvize.com"
#export TF_VAR_dyn_password=""
#export TF_VAR_github_oauth_token="$GITHUB_OAUTH_TOKEN"
#export AWS_DEFAULT_REGION="eu-central-1"
#export NOMAD_ADDR="http://10.40.2.111:4646"
#export CONSUL_ADDR="http://10.40.2.101:8500"
#alias hashui='docker container run --rm -ti -e NOMAD_ADDR="http://10.40.2.111:4646" -e CONSUL_ADDR="10.40.2.101:8500" -p 8000:3000 jippi/hashi-ui --consul-enable --nomad-enable'
#export ARTIFACTORY_USERNAME="ci"
#export ARTIFACTORY_PASS=""

function terraform_remote_state_config()
{
    if [ ${SHELL} = "/bin/zsh" ];then
        read -p "service_name?Where is you state ? (example: qa/apiv3) "
    else
        read -p "Where is you state ? (example: qa/apiv3) " service_name
    fi
    terraform remote config -backend=s3 -backend-config="bucket=idz-terraform-remote-state" -backend-config="key=environments/${service_name}/terraform.tfstate" -backend-config="region=eu-central-1"
}

function bastion_create_certif()
{
    aws ec2 describe-instances --output table   --query 'Reservations[].Instances[].[Tags[?Key==`Name`] | [0].Value, PublicIpAddress]' --filter Name=tag:Name,Values=*bastion*
    echo
    if [ ${SHELL} = "/bin/zsh" ];then
        read "bastion_ip?Bastion ip plz ?"
    else
        read -p "Bastion ip plz ?" bastion_ip
    fi
    ssh root@${bastion_ip} docker exec -i openvpn create_client samber
}
