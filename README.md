# opa-bicep-test

A small test repository demonstrating how to use Open Policy Agent (OPA) to validate Azure Bicep deployments and resources.

## What this repo is

This repository contains an example storage account Bicep template (`main.bicep`), the compiled ARM template artifact (`artifacts/main.json`), and an accompanying OPA Rego policy (`policy.rego`). It is intended to be a minimal, easy-to-follow starting point for:

- Writing Bicep modules for Azure resources
- Creating Rego policies that evaluate those Bicep templates (or the deployed ARM JSON)
- Running policy checks locally or as part of CI

## Requirements

- Azure CLI (for deploying Bicep if desired)
- Bicep CLI (or `az bicep`)
- OPA (open policy agent) or the `opa` CLI

## Quick start

1. Install required tools (Azure CLI, Bicep, OPA)
2. Build or compile the Bicep template (outputting to the tracked artifact directory):

   ```bash
   bicep build ./main.bicep --outfile ./artifacts/main.json
   ```

3. Run OPA against the generated ARM JSON (or against the templates if you convert them):

   ```bash
   opa eval --input ./artifacts/main.json --data ./policy.rego 'data.bicep.storage.allow'
   ```

Adjust the command to match your policy entrypoint.

## Running tests

If Rego unit tests are added in the future you can run them with the OPA test command. For example, if tests live alongside the policy file:

```bash
opa test ./policy.rego
```

## Contributing

Contributions welcome. Open an issue or PR describing your change.

## License

This repository does not include a license file. Add a LICENSE if you want to set terms for reuse.

---