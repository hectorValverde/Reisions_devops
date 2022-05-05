##Indiquer le OS et sa version : latest assure d'avoir la dernière version.
FROM ubuntu:latest

##Le label apporte des informations supplémentaires pour les futures lectures. 
LABEL maintener="Hector"

##Commandes à exécuter
##On met à jour les sources, et on installe en disant YES apache2 (serveur web comme nginx)
RUN apt-get update && apt-get install -y apache2

##Cette commande copie tout ce qui est dans le dossier html/* (DOIT ETRE CREE DANS LE DOSSIER) dans le dossier /var/www/html dans le container
COPY html/* /var/www/html

##on indique au programme ou on souhaite se placer
##équivalent de la commande cd
WORKDIR /var/www

##C'est les commandes qu'on souhaite passer dans le WORKDIR

CMD ["apachectl", "-D", "FOREGROUND"]
##équivalent de apachectl -D FOREGROUND

##Ca expose le port 80 : Lors du déploiment de l'image
##Le port 80 devra être ouvert pour être accéssible
EXPOSE 80
