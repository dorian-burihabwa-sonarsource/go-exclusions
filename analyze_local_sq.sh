#!/usr/bin/env bash

analyze() {
    
    if [[ -z "${SONAR_TOKEN}" ]]; then
        if [[ ! -f sonarqube.token ]]; then
            echo "Could not find file" >&2
            exit 0
        fi
        source sonarqube.token
        if [[ -z "${SONAR_TOKEN}" ]]; then
            echo "Could not load user token from sonarqube.token" >&2
            exit 0
        fi
    fi
    
    sonar-scanner \
        -Dsonar.projectKey=go-exclusions-1.15 \
        -Dsonar.sources=. \
        -Dsonar.host.url=http://localhost:9000 \
        -Dsonar.token=${SONAR_TOKEN}
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    analyze
fi