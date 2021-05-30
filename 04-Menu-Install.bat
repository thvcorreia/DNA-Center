@echo off

reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Console\TrueTypeFont" /v 00 /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Console\TrueTypeFont" /v 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Console\TrueTypeFont" /v 00 /d "Lucida Console" /f

@CHCP 1252 > NUL

cls

:menu

cls
@echo
date /t

@echo
@echo Computador: %computername%  Usuario: %username%
@echo

@echo ==========================================================================
@echo				 	MENU 
@echo ==========================================================================
@echo ==========================================================================
@echo *	
@echo *			1. "Instalação Completa"
@echo *			2. "Instalar Somente Softlab/MySQL"	
@echo *			3. "Instalar Fortes AG"	
@echo *			4. "Instalar Fortes AC"	
@echo *			5. "Correção de Erros"	
@echo *			6. "Instalação de Utilitários"	
@echo *				 
@echo ==========================================================================

pause

@echo ==========================================================================
@echo				 Iniciando a Instalação
@echo ==========================================================================

msiexec /package "\\xxxxxxx\softlab\softlab3\ControlLabCom.Setup.msi" /qb

msiexec /package "\\xxxxxxx\softlab\softlab3\ND Atualizador de Estação 1.1.8.msi" /qb

msiexec /package "\\xxxxxxx\softlab\softlab3\ND Autorizador de Convênios (Cliente) 3.5.3.msi" /qb

msiexec /package "\\xxxxxxx\softlab\softlab3\ND B2B DBrasil 1.0.1.msi" /qb

msiexec /package "\\xxxxxxx\softlab\softlab3\ND CBHPM 3.15.2.msi" /qb

msiexec /package "\\xxxxxxx\softlab\softlab3\ND Contas Médicas (Cliente) 3.27.8.msi" /qb

msiexec /package "\\xxxxxxx\softlab\softlab3\ND Documentos Atendimento 3.13.8.msi" /qb

msiexec /package "\\xxxxxxx\softlab\softlab3\ND Exportador de Resultados 1.7.14.msi" /qb

msiexec /package "\\xxxxxxx\softlab\softlab3\ND Exportador Softlab Cloud 1.1.15.msi" /qb

msiexec /package "\\xxxxxxx\softlab\softlab3\ND Integração Chame Fácil Client 1.0.4.msi" /qb

msiexec /package "\\xxxxxxx\softlab\softlab3\ND Integração Fortes (Cliente) 3.13.2.msi" /qb

msiexec /package "\\xxxxxxx\softlab\softlab3\ND Laudos 1.10.23.msi" /qb

msiexec /package "\\xxxxxxx\softlab\softlab3\ND Qualichart 3.0.2.msi" /qb

msiexec /package "\\xxxxxxx\softlab\softlab3\ND Soroteca 3.26.2.msi" /qb


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
@echo			  Verificar se há necessidade do AC ser instalado
@echo ==========================================================================

start /w \\xxxxxxx\Fortes\AG\InstalaTerminal.exe

start /w \\xxxxxxx\Fortes\AC\InstalaTerminal.exe


@echo ==========================================================================
@echo			     Configurações necessárias
@echo	  Criando e dando as permissões aos Arquivos e Pastas necessárias
@echo ==========================================================================

##nul > C:\softlab.ini

mkdir "C:\ProgramData\ND Engenharia e Software\S3\SOROTECA"

copy \\xxxxxxx\Publico\TI\00-Programas-Instalacao-Padrao\Configuracoes\SOFTLAB.INI C:\Users\Public\Desktop\ /Y

cacls C:\Users\Public\Desktop\SOFTLAB.INI /E /P Todos:F

move C:\Users\Public\Desktop\SOFTLAB.INI c:\

cacls "C:\ProgramData\ND Engenharia e Software" /E /T /P Todos:F

cacls "C:\Program Files (x86)\ND Engenharia e Software" /E /T /P Todos:F

copy \\xxxxxxx\Publico\TI\00-Programas-Instalacao-Padrao\Configuracoes\s3config.bin "C:\ProgramData\ND Engenharia e Software\S3\SOROTECA" /Y

copy \\xxxxxxx\Publico\TI\00-Programas-Instalacao-Padrao\Configuracoes\AG.ini C:\Fortes\AG /Y

cacls C:\Windows\SysWOW64\eventcreate.exe /E /T /P Todos:F

@echo ==========================================================================
@echo			     Adicionando inofrmções ao arquivos 
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
@echo				 Instalação de Utilitários
@echo ==========================================================================

@echo ==========================================================================
@echo			    Drivers das Impressora OKI e Zebra
@echo ==========================================================================

pnputil -i -a \\xxxxxxx\Publico\TI\00-Programas-Instalacao-Padrao\Programas\Driver-OKI4172-Win10\Driver\OKW3X055.inf

pnputil -i -a \\xxxxxxx\Publico\ti\00-Programas-Instalacao-Padrao\Programas\ZD5-1-16-6854\ZBRN\ZBRN.inf

@echo ==========================================================================
@echo				   LibreOffice
@echo ==========================================================================

msiexec /package \\xxxxxxx\Publico\TI\00-Programas-Instalacao-Padrao\Programas\LibreOffice\LibreOffice_6.3.4_Win_x64.msi /qb

@echo ==========================================================================
@echo				   Navegadores	
@echo ==========================================================================

start /w \\xxxxxxx\Publico\TI\00-Programas-Instalacao-Padrao\Programas\ChromeSetup.exe

start /w \\xxxxxxx\Publico\TI\00-Programas-Instalacao-Padrao\Programas\Firefox-Installer.exe /s

@echo ==========================================================================
@echo				     K-Lite
@echo ==========================================================================

start /w \\192.168.0.220\Publico\TI\00-Programas-Instalacao-Padrao\Programas\k-lite-codec-pack-mega-15-8-7.exe /SILENT

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
@echo				Instalação Silenciosa do Java 
@echo			     	   Pode demorar um pouco
@echo					Aguarde...
@echo ==========================================================================


start /w \\xxxxxxx\Publico\TI\00-Programas-Instalacao-Padrao\Programas\jre-8u271-windows-x64.exe /s


@echo ==========================================================================
@echo				 Instalação Finalizada
@echo ==========================================================================
pause
