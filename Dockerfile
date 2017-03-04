FROM lachezar/alpine-elixir:1.4.2

RUN mix local.hex --force
RUN mix local.rebar --force

RUN mkdir -p /src
WORKDIR /src
COPY . /src

# run `minikube ip` to get the external ip
ENV URL_HOST 192.168.99.100
ENV URL_PORT 30003
ENV PORT 4001
ENV NODE_NAME chat
ENV MIX_ENV=prod
RUN mix do deps.get, compile, phoenix.digest, release

CMD ["./_build/prod/rel/chat/releases/0.0.1/chat.sh", "foreground"]
