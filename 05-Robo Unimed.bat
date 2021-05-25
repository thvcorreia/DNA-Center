cls

chcp 1251

@echo
color a

echo Computador: %computername%   user: dnacenter\administrador 

@echo ==========================================================================
@echo				 Instalando Robo Unimed
@echo			  
@echo ==========================================================================


start /w \\192.168.0.220\Publico\TI\00-Programas-Instalacao-Padrao\Programas\RoboUnimed\Robo.exe

@echo ==========================================================================
@echo			     Configuracoes necessarias
@echo	  Criando e dando as permissoes aos Arquivos e Pastas necessarias
@echo ==========================================================================


xcopy \\192.168.0.220\Publico\TI\00-Programas-Instalacao-Padrao\Programas\RoboUnimed\chromedriver.exe C:\windows /Y
xcopy  C:\Users\%username%\Desktop\teste-auto-updater.lnk C:\Users\Public\Desktop /y
pause
