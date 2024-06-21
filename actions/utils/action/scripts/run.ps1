$ErrorActionPreference = "Stop"

Set-Location -Path "${env:INPUT_ACTION}\source"

npm install
node index.js
