@chcp 65001

copy "\\192.168.0.220\Publico\TI\00-Programas-Instalacao-Padrao\Configuracoes\SOFTLAB.INI" C:\Users\Public\Desktop\

cacls C:\Users\Public\Desktop\SOFTLAB.INI /E /P Todos:F

move C:\Users\Public\Desktop\SOFTLAB.INI c:\

mkdir "C:\ProgramData\ND Engenharia e Software\S3\SOROTECA"

cacls "C:\ProgramData\ND Engenharia e Software" /E /T /P Todos:F

cacls "C:\Program Files (x86)\ND Engenharia e Software" /E /T /P Todos:F

copy "\\192.168.0.220\Publico\TI\00-Programas-Instalacao-Padrao\Configuracoes\s3config.bin" "C:\ProgramData\ND Engenharia e Software\S3\SOROTECA" 

mkdir C:\PWREL

cacls C:\PWREL /E /T /P Todos:F

pause.