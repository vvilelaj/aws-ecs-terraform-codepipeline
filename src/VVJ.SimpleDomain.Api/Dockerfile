FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build
WORKDIR /src
COPY ["src/VVJ.SimpleDomain.Api/VVJ.SimpleDomain.Api.csproj", "src/VVJ.SimpleDomain.Api/"]
RUN dotnet restore "src/VVJ.SimpleDomain.Api/VVJ.SimpleDomain.Api.csproj"
COPY . .
WORKDIR "/src/src/VVJ.SimpleDomain.Api"
RUN dotnet build "VVJ.SimpleDomain.Api.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "VVJ.SimpleDomain.Api.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "VVJ.SimpleDomain.Api.dll"]
