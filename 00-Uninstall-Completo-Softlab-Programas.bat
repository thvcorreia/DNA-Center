@chcp 65001
@echo off
@ECHO.

@ECHO ==========================================================================
@ECHO			 	 Parando o Serviço do SOFTLAB
@ECHO ==========================================================================

NET STOP "ND Atualizador de Estação"

@ECHO ==========================================================================
@ECHO				 Removendo o SOFTLAB
@ECHO ==========================================================================


msiexec /uninstall "\\xxxxxxx\softlab\softlab3\ControlLabCom.Setup 1.0.2.msi" /qb

msiexec /uninstall "\\xxxxxxx\softlab\softlab3\ND Atualizador de Estação 1.1.8.msi" /qb

msiexec /uninstall "\\xxxxxxx\softlab\softlab3\ND Autorizador de Convênios (Cliente) 3.5.5.msi" /qb

msiexec /uninstall "\\xxxxxxx\softlab\softlab3\ND B2B DBrasil 1.0.1.msi" /qb

msiexec /uninstall "\\xxxxxxx\softlab\softlab3\ND CBHPM 3.15.2.msi" /qb

msiexec /uninstall "\\xxxxxxx\softlab\softlab3\ND Contas Médicas (Cliente) 3.27.9.msi" /qb

msiexec /uninstall "\\xxxxxxx\softlab\softlab3\ND Documentos Atendimento 3.13.12.msi" /qb

msiexec /uninstall "\\xxxxxxx\softlab\softlab3\ND Exportador de Resultados 1.7.15.msi" /qb

msiexec /uninstall "\\xxxxxxx\softlab\softlab3\ND Exportador Softlab Cloud 1.1.15.msi" /qb

msiexec /uninstall "\\xxxxxxx\softlab\softlab3\ND Integração Chame Fácil Client 1.0.4.msi" /qb

msiexec /uninstall "\\xxxxxxx\softlab\softlab3\ND Integração Fortes (Cliente) 3.13.2.msi" /qb

msiexec /uninstall "\\xxxxxxx\softlab\softlab3\ND Laudos 1.11.0.msi" /qb

msiexec /uninstall "\\xxxxxxx\softlab\softlab3\ND Qualichart 3.0.2.msi" /qb

msiexec /uninstall "\\xxxxxxx\softlab\softlab3\ND Soroteca 3.26.2.msi" /qb

@ECHO.
@ECHO ==========================================================================
@ECHO				 Removendo MySQL
@ECHO ==========================================================================

msiexec /uninstall programas-configuracoes\PWREL_Sem_Servico\msodbcsql_64.msi /qb

msiexec /uninstall programas-configuracoes\PWREL_Sem_Servico\MsSqlCmdLnUtils_64.msi /qb


@ECHO.
@ECHO ==========================================================================
@ECHO		  		Removendo arquivos de Configuração
@ECHO ==========================================================================

del c:\softlab.ini

del c:\softlab.log

RD c:\pwrel

RD "C:\ProgramData\ND Engenharia e Software"

RD "C:\Program Files (x86)\ND Engenharia e Software"

cacls C:\Users\Public\Desktop /E /P Todos:F

del "C:\Users\Public\Desktop\*Atalho.lnk"

cacls C:\Users\Public\Desktop /E /R Todos


@ECHO.
@ECHO ==========================================================================
@ECHO				 Remoção Finalizada
@ECHO ==========================================================================
pause
