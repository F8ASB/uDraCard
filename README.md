# uDraCard
Software to Programm SA/DRA818 on uDraCard

![alt tag](https://i2.wp.com/blog.f8asb.com/wp-content/uploads/2020/11/udracardetusvxcard.png?w=500)

Pour plus d'informations sur la carte uDraCard se rendre sur la page dedié : <http://blog.f8asb.com/usvxcard/>

## INSTALLATION LOGICIEL


Cette documentation considère que vous avez l'application GIT installée.

Se rendre dans le repertoire /opt/ et telecharger le pack:
```
cd /opt/
git clone https://github.com/F8ASB/uDraCard.git
```
## CONFIGURATION DES SWITCHS sur la uDraCard
Il est necessaire de positionner les switch 2 et 3 en ON.

## LANCEMENT LOGICIEL

```
bash /opt/uDraCard/uDraCard_config.sh
```

## LE MENU

Le menu est en deux parties:
La première pour entrer les parametres de programmation du SA/DRA818 en repondant à des questions.
Le deuxième est utiliser pour transférer les parametres dans le DRA/SA818 en liaison série.

![alt tag](http://blog.f8asb.com/wp-content/uploads/2020/11/uDraCard_menu.png?w=500)

IMPORTANT: Pour se deplacer dans le menu, utiliser les fleches, la barre espace pour selectionner et la touche tabulation pour pour aller dans la partie OK ou annuler.

## PROCEDURE
1- Eteindre le raspberry
```
sudo halt
```
2- Placer les cavaliers 2 et 3 sur ON

3- Alimenter les raspberry

4- Se connecter en SSH sur le Raspberry via putty ou en console.

5 -bash /opt/uDraCard/uDraCard_config.sh

6- choisir le menu 1 et repondre aux questions afin d'effectuer le parametrage

7- choisir le menu 2 pour programmer le SA/DRA818

8- Eteindre le raspberry ( voir etape 1)

9- Remettre les switchs 2 et 3 en OFF

10- Alimenter le Raspberry

