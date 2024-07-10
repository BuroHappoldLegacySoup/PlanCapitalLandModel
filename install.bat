REM Download miniforge
powershell -Command "Invoke-WebRequest https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Windows-x86_64.exe -OutFile Miniforge3-Windows-x86_64.exe"

REM Install mamba to user
powershell Start-Process -Wait -FilePath "Miniforge3-Windows-x86_64.exe" -ArgumentList "/InstallationType=JustMe", "/RegisterPython=0", "/S", "/D=$Env:UserProfile\Miniforge3" -NoNewWindow

REM Initialise mamba/conda for system wide use (optional)
mamba init
conda init

REM create the landmodel python environment and install dependencies
mamba create --yes --name landmodel pandas geopandas numpy plotnine ipykernel

REM activate environment
mamba activate landmodel