cls

chcp 1251

@echo
color a

echo Computador: %computername%   Usuario: %username%


@echo ==========================================================================
@echo				 Iniciando a Instalacao
@echo ==========================================================================
pause.

msiexec /package "\\xxxxxxx\publico\TI\00-Programas-Instalacao-Padrao\Programas\00-softlab3\ControlLabCom.Setup.msi" /qb

msiexec /package "\\xxxxxxx\publico\TI\00-Programas-Instalacao-Padrao\Programas\00-softlab3\ND Atualizador de Estacao.msi" /qb

msiexec /package "\\xxxxxxx\publico\TI\00-Programas-Instalacao-Padrao\Programas\00-softlab3\ND Autorizador de Convenios (Cliente).msi" /qb

msiexec /package "\\xxxxxxx\publico\TI\00-Programas-Instalacao-Padrao\Programas\00-softlab3\ND B2B DBrasil.msi" /qb

msiexec /package "\\xxxxxxx\publico\TI\00-Programas-Instalacao-Padrao\Programas\00-softlab3\ND CBHPM.msi" /qb

msiexec /package "\\xxxxxxx\publico\TI\00-Programas-Instalacao-Padrao\Programas\00-softlab3\ND Contas Medicas (Cliente).msi" /qb

msiexec /package "\\xxxxxxx\publico\TI\00-Programas-Instalacao-Padrao\Programas\00-softlab3\ND Documentos Atendimento.msi" /qb

msiexec /package "\\xxxxxxx\publico\TI\00-Programas-Instalacao-Padrao\Programas\00-softlab3\ND Exportador de Resultados.msi" /qb

msiexec /package "\\xxxxxxx\publico\TI\00-Programas-Instalacao-Padrao\Programas\00-softlab3\ND Exportador Softlab Cloud.msi" /qb

msiexec /package "\\xxxxxxx\publico\TI\00-Programas-Instalacao-Padrao\Programas\00-softlab3\ND Integracao Chame Facil Client.msi" /qb

msiexec /package "\\xxxxxxx\publico\TI\00-Programas-Instalacao-Padrao\Programas\00-softlab3\ND Integracao Fortes (Cliente).msi" /qb

msiexec /package "\\xxxxxxx\publico\TI\00-Programas-Instalacao-Padrao\Programas\00-softlab3\ND Laudos.msi" /qb

msiexec /package "\\xxxxxxx\publico\TI\00-Programas-Instalacao-Padrao\Programas\00-softlab3\ND Qualichart.msi" /qb

msiexec /package "\\xxxxxxx\publico\TI\00-Programas-Instalacao-Padrao\Programas\00-softlab3\ND Soroteca.msi" /qb


@echo ==========================================================================
@echo				 Softlab foi Instalado
@echo			Criando a pasta PWREL e Instalando MySQL
@echo ==========================================================================


mkdir C:\PWREL

cacls C:\PWREL /E /T /P Todos:F

msiexec /package \\xxxxxxx\Publico\TI\00-Programas-Instalacao-Padrao\PWREL_Sem_Servico\msodbcsql_64.msi IACCEPTMSODBCSQLLICENSETERMS=YES /qb

msiexec /package \\xxxxxxx\Publico\TI\00-Programas-Instalacao-Padrao\PWREL_Sem_Servico\MsSqlCmdLnUtils_64.msi IACCEPTMsSqlCmdLnUtilsLICENSETERMS=YES /qb


@echo ==========================================================================
@echo				 Instalando Fortes AG e AC
@echo			  Verificar se ha necessidade do AC ser instalado
@echo ==========================================================================

start /w \\xxxxxxx\Fortes\AG\InstalaTerminal.exe

start /w \\xxxxxxx\Fortes\AC\InstalaTerminal.exe


@echo ==========================================================================
@echo			     Configuracoes necessarias
@echo	  Criando e dando as permissoes aos Arquivos e Pastas necessarias
@echo ==========================================================================

##nul > C:\softlab.ini

mkdir "C:\ProgramData\ND Engenharia e Software\S3\SOROTECA"

copy \\xxxxxxx\Publico\TI\00-Programas-Instalacao-Padrao\Configuracoes\SOFTLAB.INI C:\Users\Public\Desktop\ /Y

cacls C:\Users\Public\Desktop\SOFTLAB.INI /E /P Todos:F

move C:\Users\Public\Desktop\SOFTLAB.INI c:\

cacls "C:\ProgramData\ND Engenharia e Software" /E /T /P Todos:F

cacls "C:\Program Files (x86)\ND Engenharia e Software" /E /T /P Todos:F

copy \\xxxxxxx\Publico\TI\00-Programas-Instalacao-Padrao\Configuracoes\s3config.bin "C:\ProgramData\ND Engenharia e Software\S3\SOROTECA" /Y

copy \\xxxxxxx\Fortes\AG\AG.ini C:\Fortes\AG /Y

copy \\xxxxxxx\Fortes\AC\AC.ini C:\Fortes\AC /Y

cacls C:\Windows\SysWOW64\eventcreate.exe /E /T /P Todos:F

@echo ==========================================================================
@echo			     Adicionando inofrmcoes ao arquivos 
@echo			     		HOSTS
@echo ==========================================================================

cacls C:\Windows\System32\drivers\etc\hosts /E /P Todos:F

copy \\xxxxxxx\Publico\TI\00-Programas-Instalacao-Padrao\Configuracoes\hosts C:\Windows\System32\drivers\etc\hosts

@echo ==========================================================================
@echo			        Criando Atalhos do Softlab
@echo ==========================================================================

cacls C:\Users\Public\Desktop /E /P Todos:F

copy \\xxxxxxx\Publico\TI\00-Programas-Instalacao-Padrao\Atalhos\*.* C:\Users\Public\Desktop\ /Y

cacls C:\Users\Public\Desktop /E /R Todos


@echo ==========================================================================
@echo				 Instalacao de Utilitarios
@echo ==========================================================================

@echo ==========================================================================
@echo			    Drivers das Impressora OKI
@echo ==========================================================================

pnputil -i -a \\xxxxxxx\Publico\TI\00-Programas-Instalacao-Padrao\Programas\Driver-OKI4172-Win10\Driver\OKW3X055.inf


@echo ==========================================================================
@echo				   LibreOffice
@echo ==========================================================================

msiexec /package \\xxxxxxx\Publico\TI\00-Programas-Instalacao-Padrao\Programas\LibreOffice\LibreOffice_7.0.4_Win_x64.msi /qb

@echo ==========================================================================
@echo				   Navegadores	
@echo ==========================================================================

start /w \\xxxxxxx\Publico\TI\00-Programas-Instalacao-Padrao\Programas\ChromeSetup.exe

start /w \\xxxxxxx\Publico\TI\00-Programas-Instalacao-Padrao\Programas\Firefox-Installer.exe /s

@echo ==========================================================================
@echo				     VLC
@echo ==========================================================================

start /w \\xxxxxxx\Publico\TI\00-Programas-Instalacao-Padrao\Programas\vlc-3.0.12-win64.exe /L=pt_BR /S

@echo ==========================================================================
@echo				 Impressora e Leitor PDF
@echo ==========================================================================

start /w \\xxxxxxx\Publico\TI\00-Programas-Instalacao-Padrao\Programas\CuteWriter.exe /SILENT

start /w \\xxxxxxx\Publico\TI\00-Programas-Instalacao-Padrao\Programas\AcroRdr_pt_BR.exe /sALL

@echo ==========================================================================
@echo				       7-Zip
@echo ==========================================================================

start /w \\xxxxxxx\Publico\TI\00-Programas-Instalacao-Padrao\Programas\7z1900-x64.exe /S

@echo ==========================================================================
@echo				      Anydesk
@echo ==========================================================================

start /w \\xxxxxxx\Publico\TI\00-Programas-Instalacao-Padrao\Programas\AnyDesk.exe --install "C:\Program Files (x86)\Anydesk" --silent --create-shortcuts --create-desktop-icon

echo lordasus1319 | "C:\Program Files (x86)\Anydesk\AnyDesk.exe" --set-password

@echo ==========================================================================
@echo				     TeamViewer
@echo ==========================================================================

start /w \\xxxxxxx\Publico\TI\00-Programas-Instalacao-Padrao\Programas\TeamViewer_Setup11.exe /S

net stop TeamViewer

regedit.exe /s \\xxxxxxx\Publico\TI\00-Programas-Instalacao-Padrao\Configuracoes\TeamViewer-Configuracoes.reg

net start TeamViewer

@echo ==========================================================================
@echo				       Spark
@echo ==========================================================================

start /w \\xxxxxxx\Publico\TI\00-Programas-Instalacao-Padrao\Programas\spark_2_8_3.exe -q -splash


@echo ==========================================================================
@echo				Instalacao Silenciosa do Java 
@echo			     	   Pode demorar um pouco
@echo					Aguarde...
@echo ==========================================================================


start /w \\xxxxxxx\Publico\TI\00-Programas-Instalacao-Padrao\Programas\jre-8u281-windows-x64.exe /s


@echo ==========================================================================
@echo				  Instalacao do Antivirus 
@echo			     	   Pode demorar um pouco
@echo					Aguarde...
@echo ==========================================================================

copy "\\dominio\publico\ti\Programa Kaspersky Total Security\Kaspersky Endpoint Security.exe" c:\ /Y

"c:\Kaspersky Endpoint Security.exe"

del "c:\Kaspersky Endpoint Security.exe"

@echo ==========================================================================
@echo				 Instalacao Finalizada
@echo ==========================================================================
pause
