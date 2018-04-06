node {
  deploy_target = deploy_target.trim().toLowerCase()
  git_branch_tag_or_commit = git_branch_tag_or_commit.trim()

  properties([
    parameters([
      string(
        name: 'git_branch_tag_or_commit',
        defaultValue: 'develop',
        description: 'take required branch from https://github.com/HSarode-Compumatrice/spring-mvc-showcase.git'
        ),
      string(
        name: 'deploy_target',
        defaultValue: '',
        description: 'Any environment: dev qa uat prod etc...'
      )
    ])
  ])

  stage('Checkout Codedeploy Branch') {
    sh 'date'
    sh 'pwd'
    sh 'echo git_branch_tag_or_commit=$git_branch_tag_or_commit'
    sh 'echo deploy_target=$deploy_target'
    checkout scm
    sh 'git log -n 1'
  }
  
  stage('Building Project') {
    sh 'pwd'
	  sh 'ls -lthr'
	  sh 'cd $WORKSPACE'
    sh 'mvn package'
	  sh 'ls -lthr $WORKSPACE/target'
	}
   
  stage('Push archive to S3'){
    sh '''
    aws deploy push \
      --application-name springapp \
      --s3-location s3://springappbucket/springapp-${BUILD_NUMBER}.zip \
      --source ${PWD} \
      --region ap-southeast-1
    '''
  }

  withEnv(["PATH=${env.HOME}/tools:${env.PATH}"]) {

  stage('Code Deploy') {
  // Run the codedeploy on ${deploy_target}
      sh '''
      aws deploy create-deployment \
        --application-name springapp \
        --s3-location bucket=springappbucket,key=springapp-${BUILD_NUMBER}.zip,bundleType=zip \
        --deployment-group-name ${deploy_target} \
        --description "Deployed through Jenkins." \
        --auto-rollback-configuration enabled=false \
        --ignore-application-stop-failures \
        --region ap-southeast-1 
    '''
   }
  }
}
