# NTFY on Fly.io

This is a simple example of how to use [ntfy]() with [Fly.io](https://fly.io).

## Setup

1. Create a Fly.io account and install the [Fly CLI](https://fly.io/docs/hands-on/installing/).
2. Sign up with `fly auth signup` or login with `fly auth login`.
3. Generate the `fly.toml` with `flyctl launch`, **do not deploy**.
4. Set the base_url in `server.yml` to the apps url.
5. Set ntfy admin user `fly secrets set ADMIN_USER=user` and password `fly secrets set ADMIN_PASSWORD=password`.
6. Deploy with `flyctl deploy`.

## Usage

Send message to the topic `notify` using auth `user:password`. 
`ntfy send -u user:password https://example.fly.dev/notify "example message"`

Subscribe to the topic `notify` using auth `user:password`.
`ntfy subscribe -u user:password https://example.fly.dev/subscribe/notify`
