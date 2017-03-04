FROM lachezar/alpine-elixir:1.4.2

RUN mix local.hex --force
RUN mix local.rebar --force

RUN mkdir -p /src
WORKDIR /src
COPY . /src

ENV PORT 4001
ENV NODE_NAME chat1
ENV NODE_IP 127.0.0.1
ENV ERLANG_COOKIE 42
ENV MIX_ENV=prod
RUN mix do deps.get, compile, phoenix.digest, release

CMD ["./_build/prod/rel/chat/releases/0.0.1/chat.sh", "foreground"]
