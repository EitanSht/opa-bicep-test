# opa-bicep-test

A small test repository demonstrating how to use Open Policy Agent (OPA) to validate Azure Bicep deployments and resources.

## What this repo is

This repository contains example Bicep templates and OPA Rego policy files to experiment with policy-as-code for Azure infrastructure. The goal is to provide a minimal, easy-to-follow starting point for:

- Writing Bicep modules for Azure resources
- Creating Rego policies that evaluate those Bicep templates (or the deployed ARM JSON)
- Running policy checks locally or as part of CI

## Contents

- /bicep - example Bicep templates
- /policies - OPA Rego policies and tests
- /scripts - helper scripts for running validation

(If any of these directories are not present yet, they are planned locations for the files.)

## Requirements

- Azure CLI (for deploying Bicep if desired)
- Bicep CLI (or `az bicep`)
- OPA (open policy agent) or the `opa` CLI

## Quick start

1. Install required tools (Azure CLI, Bicep, OPA)
2. Build or compile your Bicep template:

   bicep build ./bicep/main.bicep

3. Run OPA against the generated ARM JSON (or against the templates if you convert them):

   opa eval --input ./bicep/main.json --data ./policies 'data.example.allow'

Adjust the command to match your policy entrypoint.

## Running tests

If Rego unit tests are present in the /policies directory you can run them with the OPA test command:

   opa test ./policies

## Contributing

Contributions welcome. Open an issue or PR describing your change.

## License

This repository does not include a license file. Add a LICENSE if you want to set terms for reuse.

---