# NTFY on Fly.io

This is a simple example of how to deploy [ntfy](ntfy.sh) to [Fly.io](https://fly.io).

## Prerequisites

Create a Fly.io account and install cli:
1. Install the [Fly CLI](https://fly.io/docs/hands-on/installing/).
2. Sign up with `fly auth signup` or login with `fly auth login`.

## Deploy

1. Clone this repo `git clone https://github.com/joshuabrink1/ntfy-fly.git; cd ntfy-fly`
2. Run `fly launch` to generate the `fly.toml` (**do not deploy**).
3. In `fly.toml`, set the internal_port to `80`.
4. In `server.yml`, set the base_url to your app name.
    > If your app name is `example` then the base_url should be `https://example.fly.dev`
5. Deploy with:
```bash
fly deploy --build-secret ADMIN_USER=username --build-secret ADMIN_PASS=password 
``` 

## Usage

Send message to the topic `notify` using admin auth `username:password`:
```bash
ntfy send -u username:password https://example.fly.dev/notify "example message"
```

Subscribe to the topic `notify` using auth `user:password`:
```bash
ntfy subscribe -u user:password https://example.fly.dev/subscribe/notify
```

## Resources

[Build Secrets](https://fly.io/docs/reference/build-secrets/)
