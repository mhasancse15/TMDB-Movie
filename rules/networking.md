# Networking Rules

Detect and reuse the project's existing client.

Common clients:
- Dio
- http
- Retrofit
- GraphQL

Never create a second global client without a reason.

Centralize:
- base URL
- interceptors
- authentication
- timeouts
- common error mapping

Never log secrets or authorization headers.
