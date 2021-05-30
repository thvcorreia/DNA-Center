@echo
@chcp 1205 >null
@chcp 65001
@echo ==========================================================================
@echo				 Iniciando a Remoção
@echo ==========================================================================
pause

msiexec /uninstall "\\xxxxxxx\publico\TI\00-Programas-Instalacao-Padrao\Programas\00-softlab3\ControlLabCom.Setup.msi" /qb

msiexec /uninstall "\\xxxxxxx\publico\TI\00-Programas-Instalacao-Padrao\Programas\00-softlab3\ND Atualizador de Estação.msi" /qb

msiexec /uninstall "\\xxxxxxx\publico\TI\00-Programas-Instalacao-Padrao\Programas\00-softlab3\ND Autorizador de Convênios (Cliente).msi" /qb

msiexec /uninstall "\\xxxxxxx\publico\TI\00-Programas-Instalacao-Padrao\Programas\00-softlab3\ND B2B DBrasil.msi" /qb

msiexec /uninstall "\\xxxxxxx\publico\TI\00-Programas-Instalacao-Padrao\Programas\00-softlab3\ND CBHPM.msi" /qb

msiexec /uninstall "\\xxxxxxx\publico\TI\00-Programas-Instalacao-Padrao\Programas\00-softlab3\ND Contas Médicas (Cliente).msi" /qb

msiexec /uninstall "\\xxxxxxx\publico\TI\00-Programas-Instalacao-Padrao\Programas\00-softlab3\ND Documentos Atendimento.msi" /qb

msiexec /uninstall "\\xxxxxxx\publico\TI\00-Programas-Instalacao-Padrao\Programas\00-softlab3\ND Exportador de Resultados.msi" /qb

msiexec /uninstall "\\xxxxxxx\publico\TI\00-Programas-Instalacao-Padrao\Programas\00-softlab3\ND Exportador Softlab Cloud.msi" /qb

msiexec /uninstall "\\xxxxxxx\publico\TI\00-Programas-Instalacao-Padrao\Programas\00-softlab3\ND Integração Chame Fácil Client.msi" /qb

msiexec /uninstall "\\xxxxxxx\publico\TI\00-Programas-Instalacao-Padrao\Programas\00-softlab3\ND Integração Fortes (Cliente).msi" /qb

msiexec /uninstall "\\xxxxxxx\publico\TI\00-Programas-Instalacao-Padrao\Programas\00-softlab3\ND Laudos.msi" /qb

msiexec /uninstall "\\xxxxxxx\publico\TI\00-Programas-Instalacao-Padrao\Programas\00-softlab3\ND Qualichart.msi" /qb

msiexec /uninstall "\\xxxxxxx\publico\TI\00-Programas-Instalacao-Padrao\Programas\00-softlab3\ND Soroteca.msi" /qb


@echo ==========================================================================
@echo				 Softlab foi Removido
@echo				Excluindo configurações
@echo ==========================================================================

del c:\softlab.ini

del c:\softlab.log

RD c:\pwrel /S /Q

RD "C:\ProgramData\ND Engenharia e Software" /S /Q

RD "C:\Program Files (x86)\ND Engenharia e Software" /S /Q

cacls C:\Users\Public\Desktop /E /P Todos:F 

del "C:\Users\Public\Desktop\*Atalho.lnk" 

cacls C:\Users\Public\Desktop /E /R Todos


@ECHO.
@ECHO ==========================================================================
@ECHO				 Remoção Finalizada
@ECHO ==========================================================================
pause
