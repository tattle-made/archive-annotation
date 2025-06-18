# Archive Annotation

To start Archive Annotation:
  * Run `docker compose up` to start the database 
  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Steps to Build and Test Production Docker Image Locally
1. Create a file called `env.prod` and add all the enivorment variables listed in the [`env.test`](https://github.com/tattle-made/archive-annotation/blob/main/env.test) file.
2. In the [`config/runtime.exs`](https://github.com/tattle-made/archive-annotation/blob/main/config/runtime.exs) file, change the Endpoint `scheme` from `https` to `http` on [this line](https://github.com/tattle-made/archive-annotation/blob/8a0c044682f778f685eefca2180b45b1b60bd184/config/runtime.exs#L70) 
3. Start the database and build the docker image via the [`docker-compose.prod.yml`](https://github.com/tattle-made/archive-annotation/blob/main/docker-compose.prod.yml) file. Run:
```sh
docker-compose -f docker-compose.prod.yml up
```
4. You will now be able to access the site at [`localhost:4000`](http://localhost:4000) from your browser.
