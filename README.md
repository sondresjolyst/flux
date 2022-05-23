# Flux
A Flux project

## Quick Start
Start script:

    $ LOCALCLUSTER_ENV=./localcluster.env ./bootstrap.sh

If your not able to start **./bootstrap.sh** it could be that the file is missing the **Execute permission**:

    chmod +x ./bootstrap.sh

### Environment
Create a file with name **localcluster.env** in root of the project.
| Name      		    | Example				    | Comment 						    		|
|-----------------------|---------------------------|-------------------------------------------|
| export  GITHUB_TOKEN	| ghp_123				    | https://github.com/settings/tokens 	    |
| GITHUB_USER			| sondresjolyst             | Your Github Username						|
| GIT_REPO				| Flux					    | Github Repository 						|
| GIT_BRANCH			| master				    | Github Branch								|
| GIT_DIR			    | ./clusters/localcluster/  | File path for yaml files                  |
| FLUX_VERSION			| v0.30.2				    | https://github.com/fluxcd/flux2/releases  |

### What will the script do?
This script will bootstrap a flux project with:
- App-podinfo 
	- Podinfo

### Want to add more programs to the script?
First create a folder for your application inside **localcluster**

    mkdir ./clusters/localcluster/app-yourAppName

Add yourApp Repository to flux

    Flux create source git yourAppName \
	    --url=https://github.com/yourName/yourAppName \
	    --branch=master \
	    --interval=30s \
	    --export > ./clusters/localcluster/app-yourAppName/yourAppName-source.yaml

Deploy the yourApp Application

    Flux create kustomization yourAppName \
	    --source=yourAppName \
	    --path="./kustomize" \
	    --prune=true \
	    --interval=5m \
	    --export > ./clusters/localcluster/app-yourAppName/yourAppName-kustomization.yaml

  Check kustomizations  

    watch Flux get kustomizations

 
## Documentation links

| Project   | Links             				        |
|-----------|-------------------------------------------|
| Flux      | https://fluxcd.io/docs/					|
| podinfo	| https://github.com/stefanprodan/podinfo	|
