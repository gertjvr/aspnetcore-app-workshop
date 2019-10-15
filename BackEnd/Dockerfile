FROM build:latest AS build

FROM mcr.microsoft.com/dotnet/core/aspnet:3.0-buster-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443
COPY --from=build /app/publish/BackEnd .
ENTRYPOINT ["dotnet", "BackEnd.dll"]
