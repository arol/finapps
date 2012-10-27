#LaCaixa Stlvi

##Motivació
Creiem que entre els clients de La Caixa i de la banca en general hi ha noves oportunitats donades per l'aparició dels dispositius mòvils. Una que hem detectat és el fet d'aprofitar aquest nous canals per incenvitar l'estalvi.

###Per al client
El client és el més beneficiat en l'acte d'estalviar. Ja tinguin algun propòsit o per el simple det de guanyar en seguretat i estabilitat, l'estalvi sempre s'ha vist com una virtut.

###Per l'entitat
Actualment, una de les prioritats dels bancs és aconseguir i mantenir liquiditat. Una de les vies per conseguir-la és augmentant les domiciliacions de nòmines per part dels clients, però si aquets en consumeixen el 100%, de poc serveix a l'entitat. Per tant una culturització del client de l'entitat guanyaria en treure profit d'aquestes domiliacions. A més podem guanyar una oportunitat més per aprofitar els canals de comunicació que aporten els dispositius mòvils. 

##Objectius

* Introduïr i/o incentivar una cultura d'estalvi al client
* Animar a l'usuari a seguir amb aquest costum gràcies a la *game layer*
* Aconseguir major liquiditat per part de l'entitat rebaixant la volatilitat dels comptes corrents
* Oferir i promocionar els comptes d'estalvi de La Caixa i els plans d'interés fix.
* Generar informació de mercat sobre l'hàbit de consum dels clients

##L'arquitectura

Aquest sistema és basa en els dispositius mòvils i l'ús per part dels clients. Per una banda, aquests dispositius tindràn accès a l'API facilitada per l'organització per tal de disposar d'informació de l'usuari , dels seus comptes bancaris i de les seves operacions.

Per altra banda, i per tal de cobrir les necessitats de l'aplicació en l'emmagatzematge de l'aplicació, es decideix donar d'alta un servei anomenat Parse on podem emmagatzemar i consultar dades referents a les comptes d'estalvi.

Les credencials per entrar a www.parse.com són:
email:  finapps14@gmail.com
password: tiosvaigabuscarnachos

##El model de dades

Els elements d'aquest sistema representen una part (la necessària per la nostra aplicació) de la presentada a l'API de la FinApps. A més, s'associen diferents elements addicionals per tal de complir altres funcionalitats.

![img](https://www.evernote.com/shard/s9/sh/29828cdc-3b15-4224-a055-a71974a67b93/9b24dd42677c0f0460434ce678d4c08d/res/01fd248c-6362-478f-98d3-745248c5497d/skitch.png)

A continuació expliquem els elements no coneguts.

* **Categoria**: Etiqueta de text per tal d'identificar i conjuntar les diferents operacions. També tenen la característica de poder ser recurrents, o sigui que és una operació que és cobrarà cada més, com per exemple un lloguer.

* **Repte**: Un repte és un llindar inferior que es marca l'usuari sobre una categoria amb l'objectiu de rebaixar el consum sobre aquest tipus d'operacions. 

* **Objectiu**: És una fita que és marca l'usuari sobre l'estalvi en un més. Respon a l'intenció de *"Vull estalviar 5.000€ en 8 mesos"*.

##Funcionalitats

* Veure un resum de l'estalvi mensual i fer un seguiment diari que ajudi a incentivar l'estalvi
* Marcar un objectiu d'estalvi per tal d'assolir una xifra al compte d'estalvi de La Caixa
* Veure l'extracte del compte ordenat per concepte i poder categoritzar-los per un posterior anàlisi
* Veure reports del consum sobre les categories (No implementat)
* Marcar un repte en una categoria per tal de rebaixar el consum en aquesta (No implementat)
* Veure un seguiment del compte d'estalvi (No implementat)
* Rebre ofertes de la caixa de estalvi a pla fix 
* Rebre ajuda sobre l'oficina més propera i el seu horari per rebre assesorament (No implementat)

##Frameworks utilitzats

En els desenvolupament de l'aplicació mòvil s'han utilitzat els següents frameworks:

* [AFNetworking](https://github.com/AFNetworking/AFNetworking)
* [MagicalRecord](https://github.com/magicalpanda/MagicalRecord)
* [MKBlockEditions](https://github.com/MugunthKumar/UIKitCategoryAdditions/tree/master/MKAdditions)
* [CERoundProgressView](https://github.com/Ceroce/CERoundProgressView)

