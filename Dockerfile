FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["DemoDeploy/DemoDeploy.csproj", "DemoDeploy/"]
RUN dotnet restore "DemoDeploy/DemoDeploy.csproj"
COPY . .
WORKDIR "/src/DemoDeploy"
RUN dotnet build "DemoDeploy.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "DemoDeploy.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
CMD ASPNETCORE_URLS=http://*:$PORT dotnet DemoDeploy.dll