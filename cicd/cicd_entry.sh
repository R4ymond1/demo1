#!/usr/bin/env bash

function banner {

	echo "**************************************************************************"
	echo " ________  ___       __           ________  ___  ________  ________      "
	echo "|\   __  \|\  \     |\  \        |\   ____\|\  \|\   ____\|\   ___ \     "
	echo "\ \  \|\  \ \  \    \ \  \       \ \  \___|\ \  \ \  \___|\ \  \_|\ \    "
	echo " \ \   ____\ \  \  __\ \  \       \ \  \    \ \  \ \  \    \ \  \ \\\\ \   "
	echo "  \ \  \___|\ \  \|\__\_\  \       \ \  \____\ \  \ \  \____\ \  \_\\\\ \  "
	echo "   \ \__\    \ \____________\       \ \_______\ \__\ \_______\ \_______\ "
	echo "    \|__|     \|____________|        \|_______|\|__|\|_______|\|_______| "
	echo ""
	echo "**************************************************************************"

	echo "Welcome to Pothole Warning CICD Pipeline!"
}

function getParam {
	read -p "Stage you want to deploy [test int e2e prod]: " stage

	if [ "$stage"x != "test"x ] && [ "$stage"x != "int"x ] && [ "$stage"x != "e2e"x ] && [ "$stage"x != "prod"x ]
	then
		echo "Invalid stage!"
		getParam
	fi
	echo "Stage is set to: $stage" 
}

function build {
	echo "Start building source code ..."
	cd ../ || exit 1
	mvn clean install -P ${stage} -DskipFormat=true || exit 1
	echo "Finish building source code!"
}

function bootstrap {
	echo "Start environment bootstrap ..."
	cd ../infrastructure/terraform/environment/$stage/bootstrap || exit 1
	terraform init --plugin-dir /Users/raymond/.terraform.d/plugins || exit 1
#	terraform init || exit 1
	terraform apply -auto-approve || exit 1
	demo1_repo_url=$(terraform output demo1_repo_url)
	demo1_repo_url=${demo1_repo_url//\"/}
	application_bucket=$(terraform output application_bucket)
  application_bucket=${application_bucket//\"/}
	cd ../../../../../cicd || exit 1
	echo "Finish environment bootstrap!"
}

function pack {
	echo "Start build and release docker images ..."
	cd ../infrastructure/packer || exit 1
	packer build -var "stage=$stage" -var "ecr_repo=$demo1_repo_url" -var "image_tag=latest" packer_demo1_config.json || exit 1
	cd ../../cicd
	echo "Finish uploading docker images!"
}

function upload {
	echo "Start upload jar files ..."
	cd ../infrastructure/packer || exit 1
	aws s3 cp ./package/${stage}/demo1.jar "s3://${application_bucket}" --profile pw-${stage} || exit 1
	cd ../../cicd || exit 1
	echo "Finish uploading jar files!"
}

function deploy {
	echo "Start environment deployment ..."
	cd ../infrastructure/terraform/environment/${stage}/deployment || exit 1
	terraform init --plugin-dir /Users/raymond/.terraform.d/plugins || exit 1
#	terraform init
	terraform apply -auto-approve || exit 1
	cd ../../../../../cicd || exit 1
	echo "Finish environment deployment for stage: ${stage}!"
}

banner
getParam
#build
bootstrap
pack
upload
deploy

exit 1