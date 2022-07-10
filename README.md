# Escanners para CVE-2020-14882, CVE-2020-14883, CVE-202014750 de Oracle WebLogic

Escanners en diferentes lenguajes para detectar estos CVE's en las consolas de administración de Oracle WebLogic a través de path traversal.

## Nuclei
Para la plantilla de nuclei se debe utilizar la siguiente sintaxis:

```shell
nuclei -u http://IP:PUERTO/ -t WebLogic-RCE-Scanner.yaml
```

## Python
***¡Importante!***
*Existen errores cuando se procesa el archivo de hosts por lo que se recomienda probar uno a uno* (Por corregir).


## Bash
***¡Importante!***
*Existen errores cuando se le da por argumento un archivo con las urls a probar por lo que se recomienda probar una a una* (Por corregir).
