# Backend Setup Guide

Welcome to the backend setup repository! This guide will walk you through the steps required to configure and deploy the backend services using Kubernetes, Minikube, and associated tools.

## Prerequisites

- Ensure you have Docker, Minikube, kubectl, and `npx` installed on your local machine.
- Familiarity with Kubernetes concepts and basic command-line operations.

## Setup Instructions

Follow these steps to set up and deploy the backend services:

### 1. Configure Environment Variables

- **Create Environment Files**: For each deployment environment, copy the appropriate `.env.service-name.example` file to `.env` and configure it according to your environment. Ensure that all necessary environment variables are set.

### 2. Start Minikube

- **Initialize Minikube**: Before running any deployment scripts, start Minikube:

  ```bash
  minikube start
  ```

- **Enable External IPs**: Run the following command to enable external IPs for the ingress controller:

  ```bash
  minikube tunnel
  ```

### 3. Create ConfigMap

- **Run the Script**: Execute the following script to create the ConfigMap required for your services:

  ```bash
  ./create_configmap.sh
  ```

  This script sets up the necessary configuration for your deployments.

### 4. Configure Ingress

- **Check Ingress Configuration**: Open `ingress.yaml` and verify that all hostname entries are correctly set up.

- **Update Hosts File**: Add the configured hostname(s) to your local hosts file to resolve the service locally. For example, on Windows, update `C:\Windows\System32\drivers\etc\hosts`:

  ```
  127.0.0.1   your-custom-hostname.local
  ```

### 5. Deploy Kubernetes Resources

- **Run the Deployment Script**: Execute the following script to deploy all Kubernetes resources. Ensure all deployments succeed:

  ```bash
  ./deploy_k8s.sh
  ```

### 6. Deploy Ingress

- **Deploy Ingress Resources**: Before running this step, ensure that the NGINX-related deployments are up and running. Then, execute the following script to deploy the ingress resources:

  ```bash
  ./deploy_ingress.sh
  ```

### 7. Migrate the Database

- **Setup Database URL**: Configure the database URL to connect to your PostgreSQL instance in your deployment environment.

- **Run Prisma Migrations**: For each service that uses Prisma, follow these steps:

  1. Navigate to the service directory.
  2. Run the Prisma migration deploy command:

     ```bash
     npx prisma migrate deploy
     ```

### 8. Monitor the Cluster

- **Access Minikube Dashboard**: You can monitor your Kubernetes cluster and manage your deployments using the Minikube dashboard. Run the following command to open the dashboard in your default web browser:

  ```bash
  minikube dashboard
  ```

### 9. Access Services

- **Verify Deployment**: Once all scripts have been executed successfully, you can access your services using the custom hostname(s) registered in the ingress configuration.

## Troubleshooting

- **Deployment Issues**: Check the logs of the Kubernetes pods for errors using:

  ```bash
  kubectl logs <pod-name>
  ```

- **Ingress Issues**: Ensure the NGINX ingress controller is running and correctly configured.

- **Database Migration Issues**: Verify that the database URL is correctly set and that Prisma migrations are applied without errors.

## Additional Information

For more details on each script, configuration file, and deployment process, refer to the comments and documentation within the respective files.

## Contact

For further assistance, please reach out to the project maintainers or file an issue on the repository.

---

Feel free to adjust any details or instructions to fit your specific setup or preferences.