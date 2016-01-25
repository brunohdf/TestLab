Instalação do Calabash
======================

Siga os passos abaixo para executar a instalação no Mac OS X.

O Mac OS X já vem com o Ruby instalado, caso a sua versão não seja 2.0 ou superiror, recomendo trocar. Para verificar a versão do Ruby execute o comando abaixo:

```
$ ruby -v
```

Agora instale as seguintes gems:

```
$ gem install cucumber -v 1.3.20
$ gem install calabash-cucumber -v 0.16.4
$ gem install calabash-android -v 0.5.15
```

É importante instalar a versão do cucumber citada acima, para manter a compatibilitade entre o calabash iOS e Android.

Teste
-----

Para começar a escrever os seus testes você pode executar os sequintes comandos:

```
$ calabash-ios gen
```

ou

```
$ calabash-android gen
```

Tutoriais
---------

1.	[Android](android.md)
2.	[iOS](ios.md)
