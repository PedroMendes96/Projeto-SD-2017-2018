import socket
from datetime import datetime
import json
from threading import Thread
import base64


class WriteMessage(Thread):
    def __init__(self, data):
        Thread.__init__(self)
        self.pm_data = base64.b64decode(data)

    def run(self):
        self.pm_data = self.pm_data.decode('utf-8')
        self.pm_data = json.loads(self.pm_data)
        if self.pm_data['result'] == 'denied':
            print('[CardReader] Access revoked to user ' + self.pm_data['data']['userid'] + ' on room ' + self.pm_data['data']['roomid'] + ' at '+self.pm_data['data']['day']+'-'+self.pm_data['data']['month']+'-'+self.pm_data['data']['year']+'  '+self.pm_data['data']['hours']+':'+self.pm_data['data']['minutes']+':'+self.pm_data['data']['seconds'])
        else:
            print('[CardReader] Access granted to user '+ self.pm_data['data']['userid'] + ' on room ' + self.pm_data['data']['roomid'] + ' at '+self.pm_data['data']['day']+'-'+self.pm_data['data']['month']+'-'+self.pm_data['data']['year']+'  '+self.pm_data['data']['hours']+':'+self.pm_data['data']['minutes']+':'+self.pm_data['data']['seconds'])


address = ('0.0.0.0', 8004)
max_size = 1000
print('[CardReader] Starting server at', datetime.now())
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind(address)
server.listen(5)
client, addr = server.accept()

while True:
    pm_recv = client.recv(max_size)
    ThreadMessage = WriteMessage(pm_recv)
    ThreadMessage.start()
