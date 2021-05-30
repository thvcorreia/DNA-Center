cls

chcp 1251

@echo
color a

echo Computador: %computername%   user: dnacenter\administrador 

@echo ==========================================================================
@echo				 Instalando Robo Uni
@echo			  
@echo ==========================================================================


start /w \\xxxxx\Publico\TI\00-Programas-Instalacao-Padrao\Programas\RoboUnimed\Robo.exe

@echo ==========================================================================
@echo			     Configuracoes necessarias
@echo	  Criando e dando as permissoes aos Arquivos e Pastas necessarias
@echo ==========================================================================


xcopy \\xxxxx\Publico\TI\00-Programas-Instalacao-Padrao\Programas\RoboUnichromedriver.exe C:\windows /Y
xcopy  C:\Users\%username%\Desktop\teste-auto-updater.lnk C:\Users\Public\Desktop /y
pause
