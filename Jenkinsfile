pipeline {
          
agent any

environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
}

stages {
   stage ('terraform init') {
        steps {
                sh 'terraform init'
                sh 'terraform plan'

            }
        }
        

    stage ('Aplicacion') {
        steps {
                sh 'terraform apply -auto-approve'
            }
        }


    stage('Aplicacion Destroy') {
        input {
            message "Quieres destruir la infraestructura?"
            ok "si"
        }
    }

    steps {
        sh 'terraform destroy -auto-approve'
               
        }
    }
}

   