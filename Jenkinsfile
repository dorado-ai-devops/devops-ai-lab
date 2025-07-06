pipeline {
  agent any

  triggers {
    pollSCM('H/1 * * * *')
  }

  stages {
    stage('Trigger Auto PR Pipeline') {
      when {
        expression {
          return env.BRANCH_NAME == 'develop'
        }
      }
      steps {
        build job: 'auto-pr-pipeline', parameters: [
          string(name: 'GITHUB_USER', value: 'dorado-ai-devops'),
          string(name: 'GITHUB_REPO', value: 'devops-ai-lab')
        ]
      }
    }
  }
}
