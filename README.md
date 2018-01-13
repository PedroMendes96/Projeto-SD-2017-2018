# Projeto-SD-2017-2018
Distributed System Course
RP1 - Raspberry Pi responsavel pela interface grafica
RP2 - Raspberry PI responsavel pela gestao de dados
RP3 - RaspberryPi responsavel pela autenticacao

Seguir a ordem abaixo para correr com sucesso o projeto:

RP2:
- python3 EntetyManager.py
- python3 LogsManager.py
- python3 TimetableManager.py

RP3:
- python3 UsersManager.py

RP1:
- python3 CardReaderDisplay.py

RP2:
- python3 SystemMediator.py

RP1:
Se for em ambientes linux
- FLASK_APP=client.py
- python ./RP1/Flask/Flask/client.py

se for em ambientes Windows
- cd RP1/Flask/Flask
- set FLASK_RUN=client.py
- flask run //(A API REST JA ESTA A CORRER)

RP2:(Pode criar as instancias que quiser!)
- python3 CardReader.py
