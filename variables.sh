t=10
leaders=1
workers=2
my_ip="0.0.0.0" # w.x.y.z/n format
mask="0"
sg_name="swarm"

# AWS 
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export region=`cat ~/.aws/config | grep region | cut -d "=" -f2 | cut -d " " -f2`
export AWS_DEFAULT_REGION=$region

