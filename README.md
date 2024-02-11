# Windows _configuration_

Esse repositório contém recursos e instruções para configurar alguns _softwares_ no Windows.

Os comandos nas instruções abaixo foram escritos para execução no PowerShell.

## PowerShell _execution policy_

Abra o Windows PowerShell como administrador e altere a _execution policy_ de _scripts_.

```powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser
```

## Winget e _softwares_ da Microsoft

Certifique-se que o [Winget](https://learn.microsoft.com/en-us/windows/package-manager) está instalado.

Instale o Winget manualmente na [Microsoft Store](https://apps.microsoft.com/detail/9NBLGGH4NNS1) caso ele não esteja instalado.

```powershell
winget --version
```

Instale os _softwares_ da Microsoft listados abaixo.

- [PowerShell](https://www.microsoft.com/store/productId/9MZ1SNWT0N5D?ocid=pdpshare)
- [Windows Terminal](https://www.microsoft.com/store/productId/9N0DX20HK701)

```powershell
winget install --id "Microsoft.PowerShell" --source "winget"
winget install --id "Microsoft.WindowsTerminal" --source "winget"
```

## Scoop e outros _softwares_

Instale o [Scoop](https://scoop.sh).

```powershell
Invoke-RestMethod -Uri "https://get.scoop.sh" | Invoke-Expression
```

Instale os _softwares_ listados abaixo, utilizando o Scoop.

```powershell
scoop install "git"
scoop install "7zip"
scoop bucket add "extras"
scoop bucket add "nerd-fonts"
scoop bucket add "versions"
scoop install "CommitMono-NF"
scoop install "gcloud"
scoop install "python311"
scoop install "python312"
scoop install "vscode"
```

Adicione ao registro do Windows as _keys_ referentes aos _softwares_ acima, utilizando os comandos abaixo.

```powershell
& "~\scoop\apps\7zip\current\install-context.reg"
& "~\scoop\apps\python312\current\install-pep-514.reg"
& "~\scoop\apps\vscode\current\install-associations.reg"
& "~\scoop\apps\vscode\current\install-context.reg"
```

Abra o PowerShell como administrador e instale os _softwares_ abaixo utilizando o Scoop.

```powershell
scoop bucket add "nonportable"
scoop install "nonportable/file-converter-np"
```

## WSL

Certifique-se que o WSL está instalado.

```powershell
wsl --version
```

Atualize o WSL e instale a distribuição Debian do Linux.

```powershell
wsl --update
wsl --install --distribution "Debian"
```

## _Configurations_

Clone esse repositório no caminho `~\Repos\windows-configurations\`.

```powershell
New-Item -Path "~\" -Name "Repos" -ItemType "Directory" -Force
Set-Location -Path "~\Repos\"
git clone "https://github.com/pedro-cardo-vasconcellos/windows-configuration.git"
```

Execute os _scripts_ do diretório `powershell\` para configurar o Windows e os _softwares_ instalados.

```powershell
Set-Location -Path "~\Repos\windows-configuration\powershell"
& ".\configure-git.ps1"
& ".\configure-powershell.ps1"
& ".\configure-vscode.ps1"
& ".\configure-windows-context-menu.ps1"
& ".\configure-windows-terminal.ps1"
& ".\copy-shortcuts-to-desktop.ps1"
```
