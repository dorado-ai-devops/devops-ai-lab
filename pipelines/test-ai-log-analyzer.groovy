pipeline {
  agent any

  environment {
    OPENAI_API_KEY = credentials('OPENAI_API_KEY')
  }

  stages {
    stage('Call AI Log Analyzer') {
      steps {
        script {
          def response = sh(script: """
            curl -X POST http://log-analyzer-service.devops-ai.svc.cluster.local:80/analyze \\
              -H "Content-Type: application/json" \\
              -H "Authorization: Bearer $OPENAI_API_KEY" \\
              -d '{ "log": "Build failed: unable to connect to database" }'
          """, returnStdout: true).trim()
          echo "Response: ${response}"
        }
      }
    }
  }
}
