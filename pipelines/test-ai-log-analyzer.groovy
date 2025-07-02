pipeline {
    agent any

    stages {
        stage('Test AI Log Analyzer') {
            steps {
                script {
                    def response = sh(script: '''
                      curl -X POST http://log-analyzer-service.devops-ai.svc.cluster.local:80/analyze \\
                        -H "Content-Type: application/json" \\
                        -d '{"log": "Build failed: unable to connect to database"}'
                    ''', returnStdout: true).trim()
                    echo "Response from AI Log Analyzer: ${response}"
                }
            }
        }
    }
}
