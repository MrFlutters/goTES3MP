# Commit hash
$commitHash = (git rev-parse HEAD)

# Path Resolving
$goFiles = Get-ChildItem -Path 'src\' -Name '*.go' -File | Where-Object {$_ -notlike "*_test.go"}
$goFiles = $goFiles | ForEach-Object {"src/$_"}

# Build variables for go build
Set-Variable GOOS=windows
Set-Variable GOARCH=amd64

# Build command
go run -ldflags="-X 'main.Build=v0.3.0-Dev' -X 'main.GitCommit=$commitHash'" $goFiles