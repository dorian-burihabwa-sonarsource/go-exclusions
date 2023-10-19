#!/usr/bin/env bash

analyze() {
    
    if [[ -z "${SONAR_TOKEN}" ]]; then
        if [[ ! -f sonar.token ]]; then
            echo "Could not find file" >&2
            exit 0
        fi
        source sonar.token
        if [[ -z "${SONAR_TOKEN}" ]]; then
            echo "Could not load user token from sonar.token" >&2
            exit 0
        fi
    fi
    
    sonar-scanner \
        -Dsonar.organization=dorian-burihabwa-sonarsource \
        -Dsonar.projectKey=dorian-burihabwa-sonarsource_go-exclusions \
        -Dsonar.sources=. \
        -Dsonar.host.url=https://sonarcloud.io
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    analyze
fi