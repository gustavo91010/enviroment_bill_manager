para deixar um link fixo com o ip da maquina local para receber os request do api server que esta na VM
estou usando o local tunel (npm install -g localtunnel) 

o ngkok gera um novo link sempre que eu reinicio, parece que esse mantem o mesmo.
lt --port 8080 --subdomain testejoao
passar a porta e o nome do teu dominio

conseguir com esse:

> lt --port 8181 --subdomain ajudaqui12323144257892
your url is: https://ajudaqui12323144257892.loca.lt

lt --port 8181 --subdomain ajudaqui54f05eed43c14619bd9e6ddbb0b4d3a5               
para subir o link novamente, tem que rodar de novo esse comando
essea qui
