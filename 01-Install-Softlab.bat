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
@echo			    Instalação Finalizada
@echo ==========================================================================

pause
