FROM microsoft/dotnet:sdk AS build-env
WORKDIR /app

# Copy csproj and restore as distinct layers
RUN mkdir -p src/DockerCloud
COPY src/DockerCloud/DockerCloud.csproj src/DockerCloud/DockerCloud.csproj
RUN dotnet restore src/DockerCloud

# Copy everything else and build
COPY . ./
RUN dotnet publish src/DockerCloud -c Release -o /app/out

# Build runtime image
FROM microsoft/dotnet:aspnetcore-runtime
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "DockerCloud.dll"]