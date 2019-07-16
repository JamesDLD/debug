Folder's golden rule
------------
-	Store secrets
-	File containing password are ignored by any git pushing


Secret file
------------
-	<vdc_ENV_ID>_backend.json : stores the credential to write Terraform backend files
    - Content sample ==>
    ```json
        {
            "tenant_id": "xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
            "subscription_id": "xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
            "client_id": "xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
            "client_secret": "xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
        }
    ```
-	<vdc_ENV_ID>main.json : stores the credential to write in Infra and Apps Resource groups and store the VM credentials
    - Content sample ==>
    ```json
        {
            "tenant_id": "xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
            "subscription_id": "xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
            "client_id": "xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
            "client_secret": "xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
        }
    ```