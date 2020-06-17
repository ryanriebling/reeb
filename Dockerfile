FROM hayd/alpine-deno:1.0.0

EXPOSE 8080

WORKDIR /app

USER deno

COPY deps.ts .
RUN deno cache deps.ts

COPY tests/* .
RUN deno test 

COPY . .
RUN deno cache gql.ts

CMD ["run", "--allow-net", "gql.ts"]