FROM mcr.microsoft.com/dotnet/core/sdk:3.0-buster AS build
WORKDIR /src
COPY ConferencePlanner.sln .
COPY ["FrontEnd/FrontEnd.csproj", "FrontEnd/"]
COPY ["BackEnd/BackEnd.csproj", "BackEnd/"]
COPY ["ConferenceDTO/ConferenceDTO.csproj", "ConferenceDTO/"]
RUN dotnet restore

COPY . .
RUN dotnet build -c Release -o /app/build

RUN dotnet publish "BackEnd/BackEnd.csproj" -c Release -o /app/publish/BackEnd

RUN dotnet publish "FrontEnd/FrontEnd.csproj" -c Release -o /app/publish/FrontEnd
