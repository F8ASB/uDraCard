#!/usr/bin/python3
# -*- coding: utf-8 -*-

#IMPORT UTILITAIRES
import serial
import re
import parametres as s


serport = '/dev/ttyAMA0'
baud = '9600'
ser = serial.Serial(serport, baud, timeout=2)


#CONTROLE SAISIE DES FREQUENCES
def validate(freq):
	r = re.compile('\d{3}[\s.]\d{4}')
	s = str(freq)
	if len(s) ==8 and r.match(s):
		print(freq+"->FREQUENCE CONFORME")
	else:
		print('\x1b[7;37;41m'+freq+"->ERREUR DE SAISIE DE FREQUENCE, MERCI DE REFAIRE LA CONFIGURATION"+'\x1b[0m')
		exit()

def connect():
	#CONNECTION AU DRA SI=0 OK SI=1 PAS OK
	ser.write(b'AT+DMOCONNECT\r\n')
	output = ser.readline()
	print('Opening port: ' + ser.name)
	print('\r\nConnection...')
	if output.decode("utf-8")!="":
		print('reponse (0=OK): ' + output.decode("utf-8"))
	else:
		print('\x1b[7;37;41m'+"VERIFIER LA CONNEXION AVEC LE DRA/SA818! ( switch 2 et 3 en ON)"+'\x1b[0m')
		exit()

#DEFINITON DES FONCTIONS
def volume():
	volume = 'AT+DMOSETVOLUME={}\r\n'.format(s.volumelevel)
	ser.write(volume.encode())
	output = ser.readline()
	print('Reponse (0=OK) (1=KO) : ' + output.decode("utf-8"))
	
	if output.decode("utf-8")!="":
		print('reponse (0=OK): ' + output.decode("utf-8"))
	else:
		print('\x1b[7;37;41m'+"VERIFIER LA CONNEXION AVEC LE DRA/SA818! ( switch 2 et 3 en ON)"+'\x1b[0m')
		exit()

	print('Le volume est maintenant a : ' +str(s.volumelevel))
	print("-+-+-+-+-+-+-+-+-+-+-+-+-+-")

def filters():
	filter = 'AT+SETFILTER={},{},{}\r\n'.format(s.filterpre, s.highpass, s.lowpass)
	ser.write(filter.encode())
	output = ser.readline()
	print('Envoi commande filtres vers le DRA ;) ')
	print('Reponse du DRA (0=OK) (1=KO) : ' + output.decode("utf-8"))
	
	if output.decode("utf-8")!="":
		print('reponse (0=OK): ' + output.decode("utf-8"))
	else:
		print('\x1b[7;37;41m'+"VERIFIER LA CONNEXION AVEC LE DRA/SA818! ( switch 2 et 3 en ON)"+'\x1b[0m')
		exit()

	print('Reglage des filtres DRA en cours...')
	print('                                      pre/dehamphasis          highpass          lowpass')
	print('Les filtres sont maintenant a :       ' +str(s.filterpre)+'                        ' +str(s.highpass)+'             ' +str(s.lowpass))
	
def config():
	config = 'AT+DMOSETGROUP={},{},{},{},{},{}\r\n'.format(s.channelspace, s.txfreq, s.rxfreq, s.txctcss, s.squelch, s.rxctcss)
	ser.write(config.encode())
	print(config)
	output = ser.readline()
	print('Envoi commande 0=12.5kHz, 1=25kHz: '+str(s.channelspace))
	print('Envoi frequence TX: '+str(s.txfreq))
	print('Envoi frequence RX: '+str(s.rxfreq))
	print('Envoi CTCSS TX: '+str(s.txctcss))
	print('Envoi CTCSS RX: '+str(s.rxctcss))
	print('Envoi squelch: '+str(s.squelch))

validate(s.txfreq)
validate(s.rxfreq)
connect()
volume()
filters()
config()









