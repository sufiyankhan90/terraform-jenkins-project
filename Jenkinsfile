pipeline {
    agent any

    //parameters {
        //booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
        //booleanParam(name: 'destroy', defaultValue: false, description: 'Destroy Terraform build?')

    //}


     environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }


    stages {
        stage('checkout') {
            steps {
                 script{
                        dir("terraform")
                        {
                            git "https://github.com/sufiyankhan90/terraform-jenkins-project.git"
                        }
                    }
                }
            }

        stage('Plan') {
            
            steps {
                sh 'terraform init -reconfigure'
                sh "terraform plan -input=false -out tfplan "
                sh 'terraform show -no-color tfplan > tfplan.txt'
            }
        }
        
        stage('Destroy') {
        
        steps {
           sh "terraform destroy --auto-approve"
        }
    }

  }
} 
