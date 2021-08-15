FROM google/dart AS build
WORKDIR /server
COPY ./common /common
COPY ./server /server
RUN dart pub get
RUN dart compile exe bin/server.dart -o bin/server
# ENTRYPOINT [ "bin/server" ]

FROM subfuzion/dart:slim
COPY --from=build /server/bin/server /server/bin/server
ENTRYPOINT [ "/server/bin/server" ]

# Criar a imagem:
# docker build -t dart-server -f Dockerfile ../

# Ver todas imagens: 
# docker image ls

# Rodar a imagem criada:
# docker run -e PORT=3100 --rm -p 3100:3100 dart-server

# Ver as imagens rodando:
# docker ps

# Parar uma imagem rodando:
# O docker ps mostra o ID da imagem rodando, copiar e executar:
# docker stop [ID DA IMAGEM], ex: docker stop 16dbe00c1cfd