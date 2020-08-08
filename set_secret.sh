kubectl create secret <type_of_secret> <secret_name> --from-literal key=value

types of secret:
- generic (arbitrary auth) (use this)
- docker-registry (docker login)
- tls (https setup)