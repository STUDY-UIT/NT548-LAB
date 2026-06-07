# SonarQube integration

This repository uses GitHub Actions as a CI/CD service equivalent to Jenkins for the microservices pipeline. The SonarQube quality gate is configured in `.github/workflows/sonarqube.yml`.

## Required GitHub secrets

Create these secrets in the GitHub repository:

- `SONAR_HOST_URL`: SonarQube server URL, for example `http://<sonarqube-ip>:9000`
- `SONAR_TOKEN`: token generated from the SonarQube user account

## Pipeline flow

1. Checkout source code.
2. Compile the Java Product Service so SonarQube can analyze Java bytecode.
3. Run SonarQube scan for frontend, gateway, backend user, backend product and backend order.
4. Upload scanner metadata as a GitHub Actions artifact.

## Evidence for report

Use screenshots of:

- GitHub Actions workflow `SonarQube Code Quality` running successfully.
- SonarQube dashboard showing bugs, vulnerabilities, code smells and quality gate status.
