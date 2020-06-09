FROM mcr.microsoft.com/dotnet/core/sdk:3.1 as build
WORKDIR /code
COPY . .
RUN dotnet restore
RUN dotnet publish --output /output --configuration Release

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
COPY --from=build /output /app
WORKDIR /app
ENTRYPOINT [ "dotnet", "AspNetCoreOnDocker.dll" ]
