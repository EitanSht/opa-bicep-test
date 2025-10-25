package bicep.storage

# Deny storage accounts that don't have encryption enabled
deny[msg] {
    resource := input.resources[_]
    resource.type == "Microsoft.Storage/storageAccounts"
    not resource.properties.encryption.services.blob.enabled
    msg := sprintf("Storage account '%s' must have blob encryption enabled", [resource.name])
}

deny[msg] {
    resource := input.resources[_]
    resource.type == "Microsoft.Storage/storageAccounts"
    not resource.properties.encryption.services.file.enabled
    msg := sprintf("Storage account '%s' must have file encryption enabled", [resource.name])
}

# Deny storage accounts that don't enforce HTTPS
deny[msg] {
    resource := input.resources[_]
    resource.type == "Microsoft.Storage/storageAccounts"
    not resource.properties.supportsHttpsTrafficOnly
    msg := sprintf("Storage account '%s' must enforce HTTPS traffic only", [resource.name])
}

# Allow if no deny rules are triggered
allow {
    count(deny) == 0
}
